package com.yidu.hpc.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yidu.hpc.domain.Client;

/**
 * .本类为客户数据访问层接口
 * @author Administrator
 *
 */
@Repository
public interface ClientMapper {

	/**
	 * .查询所有客户
	 * @param clientPhone 
	 * @return 客户集合
	 */
	public List<Client> findAllClient(@Param("clientName")String clientName, @Param("clientPhone")String clientPhone);
	
	/**
	 * .新增客户
	 * @param client
	 * @return
	 */
	public int addClient(Client client);

	/**
	 * 根据ID查询
	 * @param cid
	 * @return
	 */
	public Client findClientById(String cid);

	/**
	 *.修改客户
	 * @param cid
	 */
	public int updateClietnById(Client client);

	public int deleteClient(String cid);
	

}
