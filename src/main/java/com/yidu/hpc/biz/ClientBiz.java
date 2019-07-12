package com.yidu.hpc.biz;

import java.util.List;

import com.yidu.hpc.domain.Client;

/**
 * .客户服务层接口
 * @author Administrator
 *
 */
public interface ClientBiz {
	
	/**
	 * .查询所有客户
	 * @param clientPhone 
	 * @param clientName 
	 * @return
	 */
	public List<Client> findAllClient(String clientName,String clientPhone);
	
	/**
	 * .新增客户
	 * @param client
	 * @return
	 */
	public boolean addClient(Client client);


	/**
	 * 根据Id查询
	 * @return
	 */
	public Client findClientById(String cid);

	/**
	 * .修改客户
	 * @return
	 */
	public boolean updateClient(Client client);

	public boolean deleteClient(String cid);

	

}
