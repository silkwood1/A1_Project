package global.sesoc.tp.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.tp.vo.ItemsVO;

/*
 * 품목 관련 DAO
 */
@Repository
public class ItemsDAO {
	@Autowired
	SqlSession sqlSession;

	public ArrayList<ItemsVO> items_list() {
		ArrayList<ItemsVO> items = new ArrayList<ItemsVO>();
		ItemsMapper mapper = sqlSession.getMapper(ItemsMapper.class);
		try{
			items = mapper.items_list();
		}catch(Exception e){
			e.printStackTrace();
		}
		return items;
	}

	
}