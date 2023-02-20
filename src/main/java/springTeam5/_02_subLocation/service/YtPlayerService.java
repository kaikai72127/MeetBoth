package springTeam5._02_subLocation.service;

import java.sql.SQLException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springTeam5._02_subLocation.model.YtPlayer;
import springTeam5._02_subLocation.model.YtPlayerRepository;



@Service
@Transactional
public class YtPlayerService {
	
	@Autowired
	private YtPlayerRepository ytRepo;
	
	public void insertYtPlayer(YtPlayer yt) {
		ytRepo.save(yt);
	}

//	搜尋全部
//	@Override
	public List<YtPlayer>searchAllYtPlayerByCourseID(Integer id) throws SQLException {
		return ytRepo.findByAllLike(id);
	}
	
//	透過courseID刪除整筆資料
	public void deleteYtPlayerFromYtPlayerID(Integer ytPlayerID) {
		ytRepo.deleteByYtPlayerID(ytPlayerID);
	}

//	透過courseID修改course的資料
	public void updateYtPlayerFromYtPlayerID(YtPlayer y) {
		ytRepo.save(y);
	}
	
	public YtPlayer searchYtPlayerByYtPlayerID(Integer id) {
		return ytRepo.findByYtPlayerID(id);
	}
	
	public List<YtPlayer> findByCourseCourseID(Integer courseID) {
		return ytRepo.findByCourseCourseID(courseID);
	}

}
