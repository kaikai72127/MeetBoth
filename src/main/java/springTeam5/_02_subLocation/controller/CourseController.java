package springTeam5._02_subLocation.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import springTeam5._02_subLocation.model.Course;
import springTeam5._02_subLocation.model.CourseComment;
import springTeam5._02_subLocation.model.CourseType;
import springTeam5._02_subLocation.service.CourseCommentService;
import springTeam5._02_subLocation.service.CourseService;
import springTeam5._02_subLocation.service.CourseTypeService;


@MultipartConfig()
@Controller
public class CourseController {

	@Autowired
	private CourseService cService;

	@Autowired
	private CourseTypeService ctService;

	@Autowired
	private CourseCommentService ccService;

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
	public String processPathToCourseDetail2(@RequestParam("id") Integer id,
			 Model mCourse, Model mComm,Model mCourseLike) throws SQLException {
		Course course = cService.searchSingleCourseFromCourseID(id);
		List<CourseComment> list = course.getCourseComment();
		ArrayList<CourseComment> comms = new ArrayList<CourseComment>();
		CourseComment comm = new CourseComment();

		if (list.isEmpty()) {
			comm.setCourseScore(0);
			comm.setCourseCustomID(404);
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
		List<Course> courseLikeTop4 = cService.findTop4CourseLikeByCourseLike(courseClass,courseid);
		mCourseLike.addAttribute("courseLikeBean",courseLikeTop4);
		
		ArrayList<Course> courses = new ArrayList<Course>();
		courses.add(course);
		mCourse.addAttribute("bean", courses);
		return "_02_subLocation/singleCourse";
	}
	//搜相似產品(4)
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
	@GetMapping("/catchSingleCourseDate.controller")
	public String processCatchSingleCourseDateAction(@RequestParam("id") Integer id, Model mCourse) {
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

//	導到insert.jsp
	@GetMapping("/pathToInsertCourse.controller")
	public String processPathToInsertCourseAction() {
		return "/_02_subLocation/InsertCourse";
	}

//	insert
	@PostMapping("/insertCourse.controller")
	public String processInsertCourseAction(@RequestParam("cClass") Integer cClass,
			@RequestParam("cName") String cName, @RequestParam("cPrice") Integer cPrice,
			@RequestParam("memID") Integer memID,
			@RequestParam("directions") String directions, @RequestParam("cPic") MultipartFile file)
			throws IOException, SQLException {
		Blob image = null;
		InputStream in = file.getInputStream();
		long size = file.getSize();
		image = fileToBlob(in, size);

		CourseType currentCourseType = ctService.findByCourseClass(cClass);
		Course newCourse = new Course();

		newCourse.setCourseName(cName);
		newCourse.setCoursePrice(cPrice);
		newCourse.setMemberID(memID);
		newCourse.setCoursePost(getCurrentDate());
		newCourse.setCourseUpdate(getCurrentDate());
		newCourse.setCourseImg(image);
		newCourse.setCourseDirections(directions);
		newCourse.setCourseSales(0);
		newCourse.setCoursetype(currentCourseType);

		LinkedHashSet<Course> courses = new LinkedHashSet<Course>();
		courses.add(newCourse);
		currentCourseType.setCourse(courses);

		ctService.insertCourse(currentCourseType);

		return "redirect:searchAllCourse.controller";
	}

//	update
	@PostMapping("/updateCourseDate.controller")
	public String processUpdateCourseAction(@RequestParam("courseClass") Integer cClass,
			@RequestParam("courseName") String cName, @RequestParam("courseID") Integer courseID,
			@RequestParam("coursePrice") Integer cPrice, @RequestParam("memberID") Integer memID,
			@RequestParam("directions") String directions,
			@RequestParam("images") MultipartFile file) {
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
		return "redirect:searchAllCourse.controller";
	}

//	delete
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
	public String processInsertCourseCommentAction(@RequestParam(value="id",required = false) Integer courseID,
			@RequestParam("comm") String comment, @RequestParam("score") Integer score) {
		try {
			Course Course = cService.searchSingleCourseFromCourseID(courseID);
			CourseComment comm = new CourseComment();

			comm.setCourseCustomID(1001);
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
			comm.setCourseCustomID(404);
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
}
