package com.yidu.hpc.biz.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.yidu.hpc.biz.ClientBiz;
import com.yidu.hpc.dao.ClientMapper;
import com.yidu.hpc.domain.Client;

/**
 * .客户接口实现类
 * 
 * @author Administrator
 *
 */
@Service
public class ClientBizImpl implements ClientBiz {

	@Autowired
	private ClientMapper clientMapper;

	@Override
	public List<Client> findAllClient(String clientName, String clientPhone) {
		// 调用dao查询全部客户并返回
		return clientMapper.findAllClient(clientName, clientPhone);
	}

	@Override
	public boolean addClient(Client client) {

		int addClient = clientMapper.addClient(client);

		if (addClient > 0) {
			return true;
		}
		return false;
	}

	@Override
	public Client findClientById(String cid) {

		return clientMapper.findClientById(cid);
	}

	@Override
	public boolean updateClient(Client client) {

		int updateClietnById = clientMapper.updateClietnById(client);
		System.out.println(updateClietnById);
		if (updateClietnById > 0) {
			return true;
		}

		return false;
	}

	@Override
	public boolean deleteClient(String cid) {
		
		int deleteClient = clientMapper.deleteClient(cid);
		
		if(deleteClient > 0) {
			return true;
		}
		
		return false;
	}

}
