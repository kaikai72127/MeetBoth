//package springTeam5._01_member.model;
//
//import java.io.Closeable;
//import java.io.IOException;
//import java.io.InputStream;
//import java.sql.Blob;
//import java.sql.SQLException;
//import java.util.Date;
//import java.util.Iterator;
//import java.util.List;
//
//import org.hibernate.Hibernate;
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//import org.hibernate.query.Query;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Repository;
//import org.springframework.transaction.annotation.Transactional;
//
//
//
//
//@Repository
//public class MemberDao {
//	
//	@Autowired
//	private SessionFactory factory;
//	
////	查詢系列
//	@Transactional
//	public List<MemberBean> searchMemByNameLike(String name){
//		Session session = factory.getCurrentSession();
//		String hql = "from MemberBean where memname like :name";
//		Query<MemberBean> query = session.createQuery(hql,MemberBean.class).setParameter("name", "%"+name+"%");
//		return query.getResultList();
//	}
//	@Transactional
//	public List<MemberBean> searchMemByAccountLike(String account){
//		Session session = factory.getCurrentSession();
//		String hql = "from MemberBean where account like :account";
//		Query<MemberBean> query = session.createQuery(hql,MemberBean.class).setParameter("account", "%"+account+"%");
//		return query.getResultList();		
//	}
//	@Transactional
//	public List<MemberBean> searchMemByAccount(String account){
//		Session session = factory.getCurrentSession();
//		String hql = "from MemberBean where account = :account";
//		Query<MemberBean> query = session.createQuery(hql,MemberBean.class).setParameter("account", account);
//		return query.getResultList();		
//	}
//	
//	@Transactional
//	public List<MemberBean> searchMemByID(int memID){
//		Session session = factory.getCurrentSession();
//		String hql = "from MemberBean where memberID = :ID";
//		Query<MemberBean> query = session.createQuery(hql,MemberBean.class)
//				.setParameter("ID",memID);
//		return query.getResultList();		
//	}
//	@Transactional
//	public List<MemberBean> searchAllMember(){
//		Session session = factory.getCurrentSession();
//		Query<MemberBean> query = session.createQuery("from MemberBean", MemberBean.class);
//		List<MemberBean> list = query.getResultList();
//		return list;
//	}
//	
////	新增
//	@Transactional
//	public MemberBean add(String account,String password,String idNumber,
//			String memName, String memNickName, int memOld, String memBirth, String memGender,
//			String eMail, String phone, String address) {
//		Session session = factory.getCurrentSession();
//		
//		MemberBean member = new MemberBean();
//		member.setAccount(account);
//		member.setAddress(address);
//		member.seteMail(eMail);
//		member.setIdNumber(idNumber);
//		member.setMemBirth(memBirth);
//		member.setMemGender(memGender);
//		member.setMemName(memName);
//		member.setMemNickName(memNickName);
//		member.setMemOld(memOld);
//		member.setPassword(password);
//		member.setPhone(phone);
//		member.setRegistime(new Date());
//		session.save(member);
//		session.flush();
//		return member;
//	}
////	依帳號修改
//	@Transactional
//	public MemberBean updateMemFromAccount(MemberBean member) {
//		Session session = factory.getCurrentSession();
//		List<MemberBean> list = searchMemByAccount(member.getAccount());
//		
//		if (list.size() != 0) {
//			Iterator<MemberBean> it = list.iterator();
//			MemberBean link = it.next();
//			MemberBean memberCheck = session.get(MemberBean.class, link.getMemberID());
//			memberCheck.setAddress(member.getAddress());
//			memberCheck.seteMail(member.geteMail());
//			memberCheck.setMemName(member.getMemName());
//			memberCheck.setMemNickName(member.getMemNickName());
//			memberCheck.setPassword(member.getPassword());
//			memberCheck.setPhone(member.getPhone());
//			session.flush();
//			return memberCheck;
//		}else {
//			return null;
//		}
//	}
////	依ID刪除
//	@Transactional
//	public boolean deleteMemfromMemberID(int memberID) {
//		Session session = factory.getCurrentSession();
//		MemberBean member = session.get(MemberBean.class, memberID);
//		if (member !=null) {
//			session.delete(member);
//			session.flush();
//			return true;
//		}else {
//			return false;
//		}
//	}
//	
//	public boolean updatePhotoFromAccount(String account, InputStream is) throws SQLException, IOException {
//		Session session = factory.getCurrentSession();
////		String hql = "update MemberBean set photo = :photo where account= :account ";
//		List<MemberBean> list = searchMemByAccount(account);
//		boolean flag = false;
//		if (list.size() != 0) {
////			Query query = session.createQuery(hql)
////					.setParameter("photo", is)
////					.setParameter("account", account);
////			query.executeUpdate();
//			Iterator<MemberBean> it = list.iterator();
//			MemberBean link = it.next();
//			MemberBean memberCheck = session.get(MemberBean.class, link.getMemberID());
//			System.out.println(is);
//			memberCheck.setPhoto(Hibernate.getLobCreator(session).createBlob(is,is.available()));
//			session.flush();
//			return flag;
//		}
//		return flag;
//			
//	}
//	
////	透過ID輸出大頭照
//	public Blob ShowPhoto(String account) throws SQLException {
//		Session session = factory.getCurrentSession();
////		Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=Team5DB;TrustServerCertificate=True", "sa", "sa123456");
////		String sql = "select photo from Member where account = ?";
////		PreparedStatement pre = conn.prepareStatement(sql);
////		pre.setString(1, ID);
////		ResultSet rs = pre.executeQuery();
////		rs.next();
////		Blob blob = rs.getBlob(1);
//		List<MemberBean> member = searchMemByAccount(account);
//		Iterator<MemberBean> it = member.iterator();
//		Blob image = null;
//		while (it.hasNext()) {
//			MemberBean memberBean = (MemberBean) it.next();
//			image = memberBean.getPhoto();
//		}
//		return image;
//	}
//	
//}
