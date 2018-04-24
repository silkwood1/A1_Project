package global.sesoc.tp.dao;

import java.util.ArrayList;
import java.util.HashMap;

import global.sesoc.tp.vo.ItemsVO;

/**
 * 품목
 */
public interface ItemsMapper {
	//리스트 불러오기
	public ArrayList<ItemsVO> items_list(String bn);
	//코드 중복처리
	public int code_search(String itemCode);
	//품목 입력
	public void item_insert(ItemsVO item);
	//정렬
	public ArrayList<ItemsVO> items_list2(HashMap<String, String> hm);
	//삭제
	public void item_delete(String itemNum);
	//상세읽기
	public ItemsVO items_info(int num);
	//수정
	public void item_update(ItemsVO item);
	//코드 중복처리2
	public String code_search2(int itemNum);
	//검색
	public ArrayList<ItemsVO> items_list3(HashMap<String, String> hm);

}
