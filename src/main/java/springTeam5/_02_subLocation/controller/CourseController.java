package springTeam5._02_subLocation.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;
import springTeam5._01_member.model.MemberBean;
import springTeam5._01_member.model.MemberService;
import springTeam5._02_subLocation.model.Course;
import springTeam5._02_subLocation.model.CourseComment;
import springTeam5._02_subLocation.model.CourseType;
import springTeam5._02_subLocation.model.YtPlayer;
import springTeam5._02_subLocation.service.CourseCommentService;
import springTeam5._02_subLocation.service.CourseService;
import springTeam5._02_subLocation.service.CourseTypeService;
import springTeam5._02_subLocation.service.YtPlayerService;

@MultipartConfig()
@Controller
public class CourseController {

	@Autowired
	private CourseService cService;

	@Autowired
	private CourseTypeService ctService;

	@Autowired
	private CourseCommentService ccService;

	@Autowired
	private YtPlayerService ytService;

	@Autowired
	private MemberService memberService;

	// 綠界使用
	AllInOne all = new AllInOne("");
	AioCheckOutALL obj = new AioCheckOutALL();

//	-----------------------------後台-----------------------
//  後台查詢全部
	@GetMapping("/_02_subLocation.index.controller")
	public String processpathToCourseIndexAction(Model mCourse) {
		List<Course> result;
		try {
			result = cService.searchAllCourse();
			mCourse.addAttribute("allcourselist", result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "_02_subLocation/courseIndex";
	}

//	後台模糊搜尋
	@PostMapping("/searchCourseWithCondition1.controller")
	public String processSearchCourseWithCondtion1(@RequestParam("case") int order,
			@RequestParam("typecase") Integer type, @RequestParam("lowprice") int low,
			@RequestParam("highprice") int high, @RequestParam("searchName") String name, Model pm)
			throws SQLException {
		String orderBy = "";
		String hasDESC = null;
		List<Course> result = null;
		if (name == null) {
			name = "";
		}

		if (order == 1) {
			result = cService.searchWithCondiOrderByCourseID(type, low, high, name);
		} else if (order == 2) {
			result = cService.searchWithCondiOrderByCoursePriceDesc(type, low, high, name);
		} else if (order == 3) {
			result = cService.searchWithCondiOrderByCoursePrice(type, low, high, name);
		} else if (order == 4) {
			result = cService.searchWithCondiOrderByCoursePost(type, low, high, name);
		} else if (order == 5) {
			result = cService.searchWithCondiOrderByCourseUpdate(type, low, high, name);
		}

		pm.addAttribute("allcourselist", result);

		return "_02_subLocation/courseIndex";
	}

//	導到後台新增
	@GetMapping("/_02_subLocation.MBinsertCourse.controller")
	public String processpathToMBinsertPordAction(HttpServletRequest request, Model m) {
		HttpSession session = request.getSession(false);

		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		List<MemberBean> mem = memberService.searchMemByAccount(account);

		if (mem.size() == 0) {
			return "login";
		} else {
			m.addAttribute("memberBean", mem.get(0));
			return "_02_subLocation/MBinsertCourse";
		}

	}

//	後台新增	
	@PostMapping("/_02_subLocation.MBinsertCourseAction.controller")
	public String processMBinsertCourseAction(@RequestParam("cName") String cName,
			@RequestParam("cClass") Integer cClass, @RequestParam("cPrice") Integer cPrice,
			@RequestParam("memID") Integer memID, @RequestParam("directions") String directions,
			@RequestParam("cPic") MultipartFile file, HttpServletRequest request) throws IOException, SQLException {
		HttpSession session = request.getSession(false);

		Optional<MemberBean> currentMemberList = memberService.searchMemByID(memID);
		MemberBean currentMember = currentMemberList.get();

		Blob image = null;
		InputStream in = file.getInputStream();
		long size = file.getSize();
		image = fileToBlob(in, size);

		CourseType currentCourseType = ctService.findByCourseClass(cClass);
		Course newCourse = new Course();

		newCourse.setCourseName(cName);
		newCourse.setCoursePrice(cPrice);
		newCourse.setCoursePost(getCurrentDate());
		newCourse.setCourseUpdate(getCurrentDate());
		newCourse.setCourseImg(image);
		newCourse.setCourseDirections(directions);
		newCourse.setCourseSales(0);
		newCourse.setCoursetype(currentCourseType);
		newCourse.setMemberBean(currentMember);

//		LinkedHashSet<Course> courses = new LinkedHashSet<Course>();
//		courses.add(newCourse);
//		currentCourseType.setCourse(courses);

		cService.insertCourse(newCourse);

		return "redirect:_02_subLocation.index.controller";
	}

//  前往後台修改畫面	
	@GetMapping("/_02_subLocation.pathToMBupdateCourse.controller")
	public String processpathToMBupdateCourseAction(HttpServletRequest request, Model m, Model mCourse,
			@RequestParam("id") Integer courseid) throws SQLException {

		HttpSession session = request.getSession(false);

		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		List<MemberBean> mem = memberService.searchMemByAccount(account);

		if (mem.size() == 0) {
			return "login";
		} else {
			m.addAttribute("memberBean", mem.get(0));
			Course course = cService.searchSingleCourseFromCourseID(courseid);

			mCourse.addAttribute("course", course);

			return "_02_subLocation/MBupdateCourse";
		}

	}

//  後台修改	
	@PostMapping("/_02_subLocation.MBupdateCourseAction.controller")
	public String processMBupdateCourseAction(@RequestParam("courseClass") Integer cClass,
			@RequestParam("courseName") String cName, @RequestParam("courseID") Integer courseID,
			@RequestParam("coursePrice") Integer cPrice, @RequestParam("memberID") Integer memID,
			@RequestParam("courseDirections") String directions, @RequestParam("images") MultipartFile file,
			HttpServletRequest request) throws IOException, SQLException {
		HttpSession session = request.getSession(false);

		Optional<MemberBean> currentMemberList = memberService.searchMemByID(memID);
		MemberBean currentMember = currentMemberList.get();

		Blob image = null;

		InputStream in = file.getInputStream();
		long size = file.getSize();
		image = fileToBlob(in, size);

		CourseType cType = ctService.findByCourseClass(cClass);
		Course course = cService.searchSingleCourseFromCourseID(courseID);
		course.setCourseName(cName);
		course.setCoursePrice(cPrice);
		course.setMemberID(memID);
		course.setCourseDirections(directions);
		course.setCourseUpdate(getCurrentDate());
		course.setCoursetype(cType);
		if (size != 0) {
			course.setCourseImg(image);
			cService.updateCourse(course);
		} else {
			cService.updateCourse(course);
		}

		return "redirect:_02_subLocation.index.controller";
	}

//	後台delete
	@PostMapping("/_02_subLocation.MBdeleteCourseById.controller")
	public String processMBDeleteMBCourseByIdAction(@RequestParam("id") Integer id) {
		cService.deleteCourseFromCourseID(id);
		return "redirect:_02_subLocation.index.controller";
	}

//	調轉到單一的管理者課程後台
	@GetMapping("/_02_subLocation.singleCourseIndex.controller")
	public String processSingleCourseIndexAction(@RequestParam("id") Integer courseID, Model mCourse)
			throws SQLException {

		Course result = cService.searchSingleCourseFromCourseID(courseID);
		mCourse.addAttribute("course", result);
		return "_02_subLocation/singleCourseIndex";
	}

//	---------------------------小工具們-----------------------
//	fileToBlob
	public Blob fileToBlob(InputStream is, long size) throws IOException, SQLException {
		byte[] b = new byte[(int) size];
		SerialBlob sb = null;
		is.read(b);
		sb = new SerialBlob(b);
		return sb;
	}

//	取得系統時間
	public String getCurrentDate() {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		return sdf.format(date);
	}

//	顯示照片
	@GetMapping("/showCoursePicture.controller")
	public void processShowPictureAction(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("id") Integer id) throws IOException {
		OutputStream os = null;
		InputStream is = null;
		Blob blob = null;
		Course course = null;

		try {
			course = cService.searchSingleCourseFromCourseID(id);
			if (course != null) {
				blob = course.getCourseImg();
				if (blob != null) {
					is = blob.getBinaryStream();
				}
			}
			response.setContentType("jpg/png");
			os = response.getOutputStream();
			int len = 0;
			byte[] bytes = new byte[8192];
			while ((len = is.read(bytes)) != -1) {
				os.write(bytes, 0, len);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (is != null) {
				is.close();
			}
			;
			if (os != null) {
				os.close();
			}
			;
		}
	}
//	---------------------------CoursePart-----------------------

//	跳轉到商品明細
	@GetMapping("/PathToCourseDetail.controller")
	public String processPathToCourseDetail2(@RequestParam("id") Integer id, Model mCourse, Model mComm,
			Model mCourseLike) throws SQLException {
		Course course = cService.searchSingleCourseFromCourseID(id);
		List<CourseComment> list = course.getCourseComment();
		ArrayList<CourseComment> comms = new ArrayList<CourseComment>();
		CourseComment comm = new CourseComment();

		if (list.isEmpty()) {
			comm.setCourseScore(0);
//			comm.setCourseCustomID(404);
			comm.setCourseComment("no comment");
			comms.add(comm);
			mComm.addAttribute("commBean", comms);
		} else {
			mComm.addAttribute("commBean", list);
		}

		if (course.getCourseDirections() == null) {
			course.setCourseDirections("--此商品沒有詳細內容說明--");
		}

		int courseClass = course.getCoursetype().getCourseClass();
		int courseid = course.getCourseID();
		List<Course> courseLikeTop4 = cService.findTop4CourseLikeByCourseLike(courseClass, courseid);
		mCourseLike.addAttribute("courseLikeBean", courseLikeTop4);

		ArrayList<Course> courses = new ArrayList<Course>();
		courses.add(course);
		mCourse.addAttribute("bean", courses);
		return "_02_subLocation/singleCourse";
	}

	// 搜相似產品(4)
	@GetMapping("/searchCourseLikeTop4.controller")
	public String processsearchCourseLikeTop4(Model mCourse) {
		List<Course> result;
		try {
			result = cService.searchAllCourse();
			mCourse.addAttribute("allcourselist", result);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "_02_subLocation/newCourseShop";
	}

//	搜全部
	@GetMapping("/searchAllCourse.controller")
	public String processSearchAllAction(Model mCourse) {
		List<Course> result;
		try {
			result = cService.searchAllCourse();
			mCourse.addAttribute("allcourselist", result);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "_02_subLocation/newCourseShop";
	}
	


//	搜單一並導到update.jsp
	@GetMapping("/catchSingleCourse.controller")
	public String processCatchSingleCourseAction(HttpServletRequest request, @RequestParam("id") Integer id,
			Model mCourse, Model m) {
		HttpSession session = request.getSession(false);

		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		List<MemberBean> mem = memberService.searchMemByAccount(account);

		if (mem.size() == 0) {
			return "login";
		} else {
			m.addAttribute("memberBean", mem.get(0));
			Course course;
			try {
				course = cService.searchSingleCourseFromCourseID(id);
				ArrayList<Course> courses = new ArrayList<Course>();
				courses.add(course);
				mCourse.addAttribute("bean", courses);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return "_02_subLocation/UpdateCourse";
		}

	}

//	導到insert.jsp
	@GetMapping("/pathToInsertCourse.controller")
	public String processPathToInsertCourseAction(HttpServletRequest request, Model m) {
		HttpSession session = request.getSession(false);

		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		List<MemberBean> mem = memberService.searchMemByAccount(account);

		if (mem.size() == 0) {
			return "login";
		} else {
			m.addAttribute("memberBean", mem.get(0));
			return "/_02_subLocation/InsertCourse";
		}

	}

//	insert
	@PostMapping("/insertCourse.controller")
	public String processInsertCourseAction(@RequestParam("cClass") Integer cClass, @RequestParam("cName") String cName,
			@RequestParam("cPrice") Integer cPrice, @RequestParam("memID") Integer memID,
			@RequestParam("directions") String directions, @RequestParam("cPic") MultipartFile file,
			HttpServletRequest request) throws IOException, SQLException {
		HttpSession session = request.getSession(false);

		Optional<MemberBean> currentMemberList = memberService.searchMemByID(memID);
		MemberBean currentMember = currentMemberList.get();

		Blob image = null;
		InputStream in = file.getInputStream();
		long size = file.getSize();
		image = fileToBlob(in, size);

		CourseType currentCourseType = ctService.findByCourseClass(cClass);
		Course newCourse = new Course();

		newCourse.setCourseName(cName);
		newCourse.setCoursePrice(cPrice);
		newCourse.setCoursePost(getCurrentDate());
		newCourse.setCourseUpdate(getCurrentDate());
		newCourse.setCourseImg(image);
		newCourse.setCourseDirections(directions);
		newCourse.setCourseSales(0);
		newCourse.setCoursetype(currentCourseType);
		newCourse.setMemberBean(currentMember);

//		LinkedHashSet<Course> courses = new LinkedHashSet<Course>();
//		courses.add(newCourse);
//		currentCourseType.setCourse(courses);

		cService.insertCourse(newCourse);

		return "redirect:pathToMemberCourse.controller";
	}

//	update
	@PostMapping("/updateCourseDate.controller")
	public String processUpdateCourseDateAction(@RequestParam("courseClass") Integer cClass,
			@RequestParam("courseName") String cName, @RequestParam("courseID") Integer courseID,
			@RequestParam("coursePrice") Integer cPrice, @RequestParam("memberID") Integer memID,
			@RequestParam("directions") String directions, @RequestParam("images") MultipartFile file) {
		Blob image = null;

		try {
			InputStream in = file.getInputStream();
			long size = file.getSize();
			image = fileToBlob(in, size);

			CourseType cType = ctService.findByCourseClass(cClass);
			Course course = cService.searchSingleCourseFromCourseID(courseID);
			course.setCourseName(cName);
			course.setCoursePrice(cPrice);
			course.setMemberID(memID);
			course.setCourseDirections(directions);
			course.setCourseUpdate(getCurrentDate());
			course.setCoursetype(cType);
			if (size != 0) {
				course.setCourseImg(image);
				cService.updateCourse(course);
			} else {
				cService.updateCourse(course);
			}
		} catch (IOException | SQLException e) {
			e.printStackTrace();
		}
		return "redirect:pathToMemberCourse.controller";
	}

//	前台delete
	@PostMapping("/deleteCourseById.controller")
	public String processDeleteCourseByIdAction(@RequestParam("id") Integer id) {
		cService.deleteCourseFromCourseID(id);
		return "redirect:searchAllCourse.controller";
	}

//	隨機搜尋

	@GetMapping("/searchRandomCourse.controller")
	public String processsearchRandomCourseAction(Model mCourse) {
		List<Course> result;
		result = cService.findRandomCourses();
		mCourse.addAttribute("allcourselist", result);
		return "_02_subLocation/newCourseShop";
	}

//	模糊搜尋
	@PostMapping("/searchCourseWithCondition.controller")
	public String processSearchCourseWithCondi(@RequestParam("case") int order, @RequestParam("typecase") Integer type,
			@RequestParam("lowprice") int low, @RequestParam("highprice") int high,
			@RequestParam("searchName") String name, Model pm) throws SQLException {
		String orderBy = "";
		String hasDESC = null;
		List<Course> result = null;
		if (name == null) {
			name = "";
		}

		if (order == 1) {
			result = cService.searchWithCondiOrderByCourseID(type, low, high, name);
		} else if (order == 2) {
			result = cService.searchWithCondiOrderByCoursePriceDesc(type, low, high, name);
		} else if (order == 3) {
			result = cService.searchWithCondiOrderByCoursePrice(type, low, high, name);
		} else if (order == 4) {
			result = cService.searchWithCondiOrderByCoursePost(type, low, high, name);
		} else if (order == 5) {
			result = cService.searchWithCondiOrderByCourseUpdate(type, low, high, name);
		}

		pm.addAttribute("allcourselist", result);

		return "_02_subLocation/newCourseShop";
	}

//	-----------------------------------------------------CommentPart-------------------------------------------------
//	新增商品評論
	@PostMapping("/InsertCourseComment.controller")
	public String processInsertCourseCommentAction(@RequestParam(value = "id", required = false) Integer courseID,
			@RequestParam("comm") String comment, @RequestParam("score") Integer score, HttpServletRequest request) {
		try {

			HttpSession session = request.getSession(false);

			String account = SecurityContextHolder.getContext().getAuthentication().getName();
			List<MemberBean> mem = memberService.searchMemByAccount(account);

			if (mem.size() == 0) {
				return "login";
			} else {

				MemberBean member = mem.get(0);

				Course Course = cService.searchSingleCourseFromCourseID(courseID);
				CourseComment comm = new CourseComment();

				comm.setMemberBean(member);
				comm.setCourseScore(score);
				comm.setCourseComment(comment);
				comm.setCourseCommentDate(getCurrentDate());
				comm.setCourse(Course);

				ccService.insertCourseComment(comm);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:PathToCourseDetail.controller?id=" + courseID;
	}

//	Comment + CommentByOrderBy
	@GetMapping("/PathToCourseDetailWithCommentOrerBy.controller")
	public String processPathToCourseDetailWithCommentOrerBy(@RequestParam("id") Integer id,
			@RequestParam("commentOrderBy") Integer order, Model mCourse, Model mComm) throws SQLException {
		Course course = cService.searchSingleCourseFromCourseID(id);
		List<CourseComment> list = course.getCourseComment();
		ArrayList<CourseComment> comms = new ArrayList<CourseComment>();
		CourseComment comm = new CourseComment();
		List<CourseComment> commentOrderList = null;

		if (list.isEmpty()) {
			comm.setCourseScore(0);
//			comm.setCourseCustomID(404);
			comm.setCourseComment("no comment");
			comms.add(comm);
			mComm.addAttribute("commBean", comms);
		} else {
			switch (order) {
			case 1:
				commentOrderList = ccService.findAllByOrderByCourseCommentDateDESC();
				mComm.addAttribute("commBean", commentOrderList);
				break;
			case 2:
				commentOrderList = ccService.findAllByOrderByCourseCommentDate();
				mComm.addAttribute("commBean", commentOrderList);
				break;
			case 3:
				commentOrderList = ccService.findAllByOrderByCourseScoreDESC();
				mComm.addAttribute("commBean", commentOrderList);
				break;
			case 4:
				commentOrderList = ccService.findAllByOrderByCourseScore();
				mComm.addAttribute("commBean", commentOrderList);
				break;
			default:
				mComm.addAttribute("commBean", list);
				break;
			}
		}

		if (course.getCourseDirections() == null) {
			course.setCourseDirections("--此商品沒有詳細內容說明--");
		}

		ArrayList<Course> courses = new ArrayList<Course>();
		courses.add(course);
		mCourse.addAttribute("bean", courses);
		return "_02_subLocation/courseDetail";
	}

//	---------------------------YtPlayerPart-----------------------

//	跳轉個人課程
	@GetMapping("/pathToSearchAllCourseMember.controller")
	public String processPathToSearchAllCourseMemberAction(HttpServletRequest request,Model m) {
		HttpSession session = request.getSession(false);

		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		List<MemberBean> mem = memberService.searchMemByAccount(account);

		if (mem.size() == 0) {
			return "login";
		} else {
			m.addAttribute("memberbuy", mem.get(0));
			return "/_02_subLocation/newCourseShopMember";
		}
	}
	


//	課程影片明細
	@GetMapping("/YtDetail.controller")
	public String processYtDetail(HttpServletRequest request,Model m,@RequestParam("id") Integer id, @RequestParam("courseID") Integer courseID,
			Model mCourse, Model mSingleCourse, Model mYtPlayer, Model mComm) throws SQLException {
		HttpSession session = request.getSession(false);

		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		List<MemberBean> mem = memberService.searchMemByAccount(account);
		
		if (mem.size() == 0) {
			return "login";
		} else {
		m.addAttribute("memberbuy", mem.get(0));
		Course course = cService.searchSingleCourseFromCourseID(courseID);
		YtPlayer yt = ytService.searchYtPlayerByYtPlayerID(id);

		mSingleCourse.addAttribute("singleCourseBean", course);
		mYtPlayer.addAttribute("bean", yt);

		List<CourseComment> list = course.getCourseComment();
		ArrayList<CourseComment> comms = new ArrayList<CourseComment>();
		CourseComment comm = new CourseComment();

		if (list.isEmpty()) {
			comm.setCourseScore(0);
//			comm.setCourseCustomID(404);
			comm.setCourseComment("no comment");
			comms.add(comm);
			mComm.addAttribute("commBean", comms);
		} else {
			mComm.addAttribute("commBean", list);
		}

		if (course.getCourseDirections() == null) {
			course.setCourseDirections("--此商品沒有詳細內容說明--");
		}

//		List<Course> courseList = cService.searchAllCourseByMemberID(course.getMemberID());
//		ArrayList<Course> courses = new ArrayList<Course>();
//		Course c = new Course();
//
//		if (list.isEmpty()) {
//			course.setCourseName("無課程");
//			course.setMemberID(id);
//			courses.add(c);
//			mCourse.addAttribute("courseBean", courses);
//		} else {
//			mCourse.addAttribute("courseBean", courseList);
//		}

//		if (course.getCourseDirections() == null) {
//			course.setCourseDirections("--此商品沒有詳細內容說明--");
//		}

		return "_02_subLocation/ytPlayer";
		}
	}

//	新增商品評論 ??
	@PostMapping("/InsertCourseCommentUnderYt.controller")
	public String processInsertCourseCommentUnderYtAction(
			@RequestParam(value = "id", required = false) Integer courseID, @RequestParam("comm") String comment,
			@RequestParam("score") Integer score, @RequestParam("ytPlayerID") Integer ytPlayerID) {
		try {
			Course Course = cService.searchSingleCourseFromCourseID(courseID);
			CourseComment comm = new CourseComment();

//			comm.setCourseCustomID(1001);
			comm.setCourseScore(score);
			comm.setCourseComment(comment);
			comm.setCourseCommentDate(getCurrentDate());
			comm.setCourse(Course);

			List<CourseComment> courseCommment = new ArrayList<CourseComment>();
			courseCommment.add(comm);
			Course.setCourseComment(courseCommment);

			cService.insertCourseComment(Course);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:YtDetail.controller?id=" + ytPlayerID + "&courseID=" + courseID;
	}
//	---------------------------個人課程賣場Part-----------------------
//	進入個人賣場全部課程
	@GetMapping("/pathToMemberCourse.controller")
	public String processPathToMemberCourseWithYt(Model mCourse, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		MemberBean member = (MemberBean) session.getAttribute("Member");

		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		List<MemberBean> mem = memberService.searchMemByAccount(account);

		if (mem.size() == 0) {
			return "login";
		} else {
			mCourse.addAttribute("memberBean", mem.get(0));
			return "/_02_subLocation/memberCourse";
		}
	}

//	進入個人會員全部課程明細
//	@GetMapping("/pathToMemberCourseDetail.controller")
//	public String processPathToMemberYtDetail(@RequestParam("id") Integer id, Model mCourse, Model mYtPlayer)
//			throws SQLException {
//		Course course = cService.searchSingleCourseFromCourseID(id);
//		List<YtPlayer> list = course.getYtPlayer();
//		ArrayList<YtPlayer> yts = new ArrayList<YtPlayer>();
//		YtPlayer yt = new YtPlayer();
//
//		if (list.isEmpty()) {
//			yt.setYtPlayerName("no video");
//			yt.setYtPlayerURL("no URL");
//			yts.add(yt);
//			mYtPlayer.addAttribute("ytBean", yts);
//		} else {
//			mYtPlayer.addAttribute("ytBean", list);
//		}
//
//		ArrayList<Course> courses = new ArrayList<Course>();
//		courses.add(course);
//		mCourse.addAttribute("bean", courses);
//
//		return "_02_subLocation/memberSingleCourseAddYt";
//	}

//	模糊搜尋(個人賣場)
	@PostMapping("/searchCourseWithCondition2.controller")
	public String processSearchProductWithCondi3(@RequestParam("case") int order,
			@RequestParam("typecase") Integer type, @RequestParam("lowprice") int low,
			@RequestParam("highprice") int high, @RequestParam("searchName") String name, Model cm, Model mCourse)
			throws SQLException {
		String orderBy = "";
		String hasDESC = null;
		List<Course> result = null;
		if (name == null) {
			name = "";
		}

		if (order == 1) {
			result = cService.searchWithCondiOrderByCourseID(type, low, high, name);
		} else if (order == 2) {
			result = cService.searchWithCondiOrderByCoursePriceDesc(type, low, high, name);
		} else if (order == 3) {
			result = cService.searchWithCondiOrderByCoursePrice(type, low, high, name);
		} else if (order == 4) {
			result = cService.searchWithCondiOrderByCoursePost(type, low, high, name);
		} else if (order == 5) {
			result = cService.searchWithCondiOrderByCourseUpdate(type, low, high, name);
		}

		cm.addAttribute("prodList", result);

		return "redirect:pathToMemberCourse.controller";
	}

	
//	導到新增影片.jsp
	@GetMapping("/pathToInsertYtPlayer.controller")
	public String processPathToInsertYtPlayerAction(HttpServletRequest request, @RequestParam("id") Integer id,
			Model mCourse, Model m) {
		HttpSession session = request.getSession(false);

		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		List<MemberBean> mem = memberService.searchMemByAccount(account);

		if (mem.size() == 0) {
			return "login";
		} else {
			m.addAttribute("memberBean", mem.get(0));
			Course course;
			try {
				course = cService.searchSingleCourseFromCourseID(id);
				ArrayList<Course> courses = new ArrayList<Course>();
				courses.add(course);
				mCourse.addAttribute("bean", courses);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return "_02_subLocation/memberSingleCourseAddYt";
		}

	}

	

//	新增影片
	@PostMapping("/insertYtPlayer.controller")
	public String processinsertYtPlayerAction(@RequestParam(value = "id", required = false) Integer courseID,
			@RequestParam("ytPlayerName") String ytPlayerName, @RequestParam("ytPlayerURL") String ytPlayerURL, HttpServletRequest request) {
		try {

			HttpSession session = request.getSession(false);

			String account = SecurityContextHolder.getContext().getAuthentication().getName();
			List<MemberBean> mem = memberService.searchMemByAccount(account);

			if (mem.size() == 0) {
				return "login";
			} else {

				MemberBean member = mem.get(0);

				Course Course = cService.searchSingleCourseFromCourseID(courseID);
				YtPlayer yt = new YtPlayer();

				yt.setMemberBean(member);
				yt.setYtPlayerName(ytPlayerName);
				yt.setYtPlayerURL(ytPlayerURL);
				yt.setCourse(Course);

				ytService.insertYtPlayer(yt);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:pathToMemberCourse.controller";
	}

//	---------------------------MapPart-----------------------	
//	搜全部
	@GetMapping("/searchAllMap.controller")
	public String processSearchAllMapAction(Model mCourse) {
		List<Course> result;
		try {
			result = cService.searchAllCourse();
			mCourse.addAttribute("allcourselist", result);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "_02_subLocation/map";
	}
	
	@GetMapping("/_02_memberresume.controller")
	public String processproductFontPageAction(Model m,HttpServletRequest request,@RequestParam("id")Integer memID) {
		
		Optional<MemberBean> mem = memberService.searchMemByID(memID);
		m.addAttribute("memberBean", mem.get());

		
		return "_02_subLocation/_02_memberresume";
	}

}
