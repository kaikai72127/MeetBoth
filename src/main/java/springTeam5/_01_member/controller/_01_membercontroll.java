package springTeam5._01_member.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import springTeam5._01_member.model.MemberBean;
import springTeam5._01_member.model.MemberService;


@Controller
public class _01_membercontroll {
	
	@Autowired
	private MemberService ms;
	
	

//	網址反應器
//	@RequestMapping(path = "/html/_01_member/admin",method = RequestMethod.GET)
//	public String memberAdmin() {
//		return "_01_member/admin";
//	}
	
					/*這邊用Spring Security替代*/
////	登入
//	@GetMapping(path = "/_01_member.Login.controller")
//	public String Login() {
//		return "_01_member/Login";
//	}
////	驗證
//	@PostMapping(path = "/_01_member.Oath.controller")
//	public String Oath(@RequestParam("username") String username, 
//			@RequestParam("password" ) String password,HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
//		String user = request.getParameter(username);
//		if (user != null) {
//			return "backIndex";
//		}else if (username.equals("admin") && password.equals("admin123")) {
//			
//	            session.setAttribute("username", username);
//	            session.setAttribute("password", password);
//	            
////	            response.sendRedirect("../../backIndex.controller");
//	            return "backIndex";
//	        } else {
//	            return "redirect:_01_member.Login";
//	        }
//	}
//	
////	登出
//	@GetMapping(path = "/_01_member.Logout.controller")
//	public String Logout() {
//		return "_01_member/Logout";
//	}
//	
////	確認登出
//	@GetMapping(path = "/_01_member.confirm.controller")
//	public String LogoutConfirm(@RequestParam("check") int value, HttpServletRequest request) {
//		HttpSession session = request.getSession();
//		if (value == 1) {
//			session.invalidate();
//			return "redirect:/index.controller";
//		}else {
//			return "/backIndex.controller";
//		}
//	}
	
//	登入動態顯示
	@ResponseBody
	@PostMapping("/_01_member.checklog.controller")
	public String loginRWD() {
		String user = "";
		user = SecurityContextHolder.getContext().getAuthentication().getName();
		return user;
	}
	
//	權限動態控制
	@ResponseBody
	@PostMapping("/admin/_01_member.rolecheck.controller")
	public String roleRWD() {
//		String user = "";
//		user = SecurityContextHolder.getContext().getAuthentication().getName();
//		List<MemberBean> list = ms.searchMemByAccount(user);
		String role = SecurityContextHolder.getContext().getAuthentication().getAuthorities().toArray()[0].toString();
//		String role = "";
//		for (MemberBean member : list) {
//			role = member.getRole();
//		}
		return role;
	}
	
	
//	查詢類controll
	@PreAuthorize("hasRole('admin')")
	@GetMapping("/_01_member.admin.controller")
	public String admin(Model m) {
		List<MemberBean> all = ms.searchAllMember();
		m.addAttribute("Member", all);
		return "_01_member/admin";
	}
	
	@PostMapping("/_01_member.selectAll.controller")
	public String selectAll(Model m) {
		List<MemberBean> all = ms.searchAllMember();
		m.addAttribute("Member", all);
		return "_01_member/admin";
	}
	
	@PostMapping(path = "/_01_member.selectByAccount.controller")
	public String selectByAccountLike(@RequestParam("selectByAccount") String account, @RequestParam("value") String value, Model m) {
		
		List<MemberBean> mal = ms.searchMemByAccountLike(value);
		m.addAttribute("Member",mal);
		return "_01_member/admin";			
		
	}
	
	@PostMapping(path = "/_01_member.selectByName.controller")
	public String selectByNameLike(@RequestParam("value") String value, Model m) {
			List<MemberBean> mnl = ms.searchMemByNameLike(value);
			m.addAttribute("Member",mnl);
			return "_01_member/admin";		
	}
	
//	顯示圖片
	@GetMapping(path = "/_01_member.ShowPhoto.controller")
	public void showPhoto(HttpServletRequest request, HttpServletResponse response) {
		Blob blob = null;
		InputStream is = null;
		String account = request.getParameter("account");
		response.setContentType("image/jpeg");
		OutputStream os = null;
		try {
			os = response.getOutputStream();
			blob = ms.showPhoto(account);
			System.out.println(blob);
			if (blob != null ) {
				is = blob.getBinaryStream();
				int len = 0;
				byte[] bytes = new byte[8192];
				while ((len = is.read(bytes)) != -1) {
					os.write(bytes, 0, len);
				}				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			   if (is != null)
				try {
					is.close();
					if (os != null) os.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			  }
	}
	
//	新增
	@PostMapping("/_01_member.register.controller")
	public String register() {
		return "_01_member/register";
	}
	
	@PostMapping("/_01_member.add.controller")
	public String add(@ModelAttribute() MemberBean member,@RequestParam("photofile") MultipartFile mf , Model m) throws IOException, SerialException, SQLException {
		
		String fileName = "";
		MemberBean newMember = member;
		InputStream is = null;
		String encodePwd = new BCryptPasswordEncoder().encode(member.getPassword());
		newMember.setPassword(encodePwd);
		newMember.setMemberID(0);
		if (ms.searchMemByAccount(member.getAccount()).size() == 0) {
			fileName = mf.getOriginalFilename();
			if (fileName != null && fileName.trim().length() > 0) {
				long size = mf.getSize();
				is = mf.getInputStream();
				byte[] b = new byte[(int) size];
				SerialBlob sb = null;
				is.read(b);
				sb = new SerialBlob(b);
				newMember.setPhoto(sb);
				ms.add(newMember);
			}else {
				ms.add(newMember);
			}
		}
		return "redirect:/_01_member.admin.controller";
	}
	
//	修改
	@PostMapping(path = "/_01_member.preupdate.controller")
	public String preupdate(@RequestParam("preupdate") int memberID, Model m) {
		List<MemberBean> data = ms.searchMemByID(memberID);
//		List<MemberBean> list = data.stream().collect(Collectors.toList());
		m.addAttribute("Member", data);
		return "_01_member/memberupdate";
	}
	
	@PostMapping(path = "/_01_member.update.controller")
	public String update(@ModelAttribute() MemberBean member,@RequestParam("photofile") MultipartFile mf) throws IOException, SerialException, SQLException {
		
		String fileName ="";
		MemberBean newMem = new MemberBean();
		List<MemberBean> list = ms.searchMemByAccount(member.getAccount());
		
		if (list.size() != 0) {
			MemberBean check = list.get(0);
			newMem.setMemberID(check.getMemberID());
			newMem.setAccount(check.getAccount());
			newMem.setPassword(new BCryptPasswordEncoder().encode(member.getPassword()));
			newMem.setIdNumber(member.getIdNumber());
			newMem.setMemName(member.getMemName());
			newMem.setMemNickName(member.getMemNickName());
			newMem.setMemOld(member.getMemOld());
			newMem.setMemBirth(member.getMemBirth());
			newMem.setMemGender(member.getMemGender());
			newMem.seteMail(member.geteMail());
			newMem.setPhone(member.getPhone());
			newMem.setPhoto(check.getPhoto());
			newMem.setAddress(member.getAddress());
			newMem.setRole(check.getRole());
			System.out.println(newMem.toString());
			fileName = mf.getOriginalFilename();
			if (fileName != null && fileName != "" && fileName.trim().length() > 0) {
				long size = mf.getSize();
				InputStream is = mf.getInputStream();
				byte[] b = new byte[(int) size];
				SerialBlob sb = null;
				is.read(b);
				sb = new SerialBlob(b);
				newMem.setPhoto(sb);
				ms.update(newMem);
			}else {
				ms.update(newMem);
			}
		}
		return "redirect:/_01_member.admin.controller";
	}
	
//	刪除
	@PostMapping(path = "/_01_member.delete.controller")
	public String delete(@RequestParam("delete") String account) {
		ms.delete(account);
		return "redirect:/_01_member.admin.controller";
	}
	
	
	
}
