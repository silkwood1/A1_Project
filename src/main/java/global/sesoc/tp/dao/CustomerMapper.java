package global.sesoc.tp.dao;

import java.util.ArrayList;

import global.sesoc.tp.vo.CustomerVO;

public interface CustomerMapper {

	public ArrayList<CustomerVO> customerList(CustomerVO cvo);
	
	
}
