package springTeam5._01_member.model;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MemberService {

	@Autowired
	private MemberRepository memberRepository;
	
//	新增
	public MemberBean add(MemberBean member) {
		return memberRepository.save(member);
	}
	
//	刪除
	public void delete(Integer memberID) {
		memberRepository.deleteById(memberID);
	}
	
//	修改
	public MemberBean update(MemberBean member) {
		return memberRepository.save(member);
	}
	
//	查詢系列
	public List<MemberBean> searchMemByNameLike(String name){
		return memberRepository.searchMemByNameLike(name);
	}
	
	public List<MemberBean> searchMemByAccountLike(String account){
		return memberRepository.searchMemByAccountLike(account);
	}
	
	public List<MemberBean> searchMemByAccount(String account){
		return memberRepository.searchMemByAccount(account);
	}
	
	public Optional<MemberBean> searchMemByID(int memID){
		return memberRepository.findById(memID);
	}
	public List<MemberBean> searchAllMember(){
		return memberRepository.findAll();
	}
	public List<MemberBean> searchMemByMail(String email) {
		return memberRepository.searchMemByMail(email);
	}
	public List<MemberBean> searchMemBykeyword(String key) {
		return memberRepository.searchMemBykey(key);
	}
	public Blob showPhoto(String account) throws SQLException, IOException {
		List<MemberBean> member = memberRepository.searchMemByAccount(account);
		Iterator<MemberBean> it = member.iterator();
		Blob image = null;
		while (it.hasNext()) {
			MemberBean memberBean = (MemberBean) it.next();
			image = memberBean.getPhoto();
		}
		if (image != null) {
			return image;			
		}else {
			FileInputStream fis = new FileInputStream("../SpringBoot_Team5/src/main/webapp/WEB-INF/resources/images/meatball-200.png");
			InputStream is = new BufferedInputStream(fis);
			byte[] b = new byte[fis.available()];
			SerialBlob sb = null;
			is.read(b);
			sb = new SerialBlob(b);
			return sb;
		}
	}
}

