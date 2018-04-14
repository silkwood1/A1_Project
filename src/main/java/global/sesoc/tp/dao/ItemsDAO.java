package global.sesoc.tp.dao;

import java.util.ArrayList;
import java.util.HashMap;

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

	public ArrayList<ItemsVO> items_list(String bn) {
		ArrayList<ItemsVO> items = new ArrayList<ItemsVO>();
		ItemsMapper mapper = sqlSession.getMapper(ItemsMapper.class);
		try{
			items = mapper.items_list(bn);
		}catch(Exception e){
			e.printStackTrace();
		}
		return items;
	}

	public int code_search(String itemCode) {
		int a = 0;
		ItemsMapper mapper = sqlSession.getMapper(ItemsMapper.class);
		try{
			a = mapper.code_search(itemCode);
		}catch(Exception e){
			e.printStackTrace();
		}
		return a;
	}

	public void item_insert(ItemsVO item) {
		ItemsMapper mapper = sqlSession.getMapper(ItemsMapper.class);
		try{
			mapper.item_insert(item);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	public ArrayList<ItemsVO> items_list2(HashMap<String, String> hm) {
		ArrayList<ItemsVO> items = new ArrayList<ItemsVO>();
		ItemsMapper mapper = sqlSession.getMapper(ItemsMapper.class);
		try{
			items = mapper.items_list2(hm);
		}catch(Exception e){
			e.printStackTrace();
		}
		return items;
	}

	public void item_delete(String itemNum) {
		ItemsMapper mapper = sqlSession.getMapper(ItemsMapper.class);
		try{
			mapper.item_delete(itemNum);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	public ItemsVO item_info(int num) {
		ItemsVO items = new ItemsVO();
		ItemsMapper mapper = sqlSession.getMapper(ItemsMapper.class);
		try{
			items = mapper.items_info(num);
		}catch(Exception e){
			e.printStackTrace();
		}
		return items;
	}

	
}