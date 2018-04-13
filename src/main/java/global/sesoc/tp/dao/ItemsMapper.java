package global.sesoc.tp.dao;

import java.util.ArrayList;

import global.sesoc.tp.vo.ItemsVO;

/**
 * 품목
 */
public interface ItemsMapper {
	//리스트 불러오기
	public ArrayList<ItemsVO> items_list();

}
