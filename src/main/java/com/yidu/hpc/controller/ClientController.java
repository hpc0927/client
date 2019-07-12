package com.yidu.hpc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.UUID;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yidu.hpc.biz.ClientBiz;
import com.yidu.hpc.domain.Client;

/**
 * .本类为客户控制器
 * 
 * @author Administrator
 *
 */
@RequestMapping("/client")
@Controller
public class ClientController {

	// 自动装配ClientBiz
	@Autowired
	private ClientBiz clientBiz;

	/**
	 * ,查询全部用户
	 * 
	 * @return
	 */
	@RequestMapping(value = "/finAllClient", method = RequestMethod.GET)
	public String findAllClient(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model,
			String clientName, String clientPhone) {
		// 分页查询,传入页码,以及每页大小
		PageHelper.startPage(pn, 5);
		// 调用服务层查询全部用户
		List<Client> clients = clientBiz.findAllClient(clientName, clientPhone);
		// 将客户数据封装到pageinInfo中
		PageInfo<Client> pageInfo = new PageInfo<Client>(clients, 5);
		// 将数据存到model域
		model.addAttribute("pageInfo", pageInfo);

		// 转发到首页
		return "index";
	}

	/**
	 * .根据Id查询
	 * 
	 * @return
	 */

	@RequestMapping(value = "/updateUiAndfindById/{clientId}", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> updateUiAndfindById(@PathVariable(value = "clientId") String clientId) {

		Client client = clientBiz.findClientById(clientId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("clientMap", client);
		return map;

	}

	/**
	 * 
	 * .新增用户
	 */
	@RequestMapping(value = "/saveClient", method = RequestMethod.POST)
	public String saveClient(@Valid Client client, BindingResult result, Model model) {

		boolean hasErrors = result.hasErrors();
		if (hasErrors) {
			System.out.println("有检验错误");
			List<FieldError> errors = result.getFieldErrors();
			for (FieldError fieldError : errors) {
				System.out.println("错误消息提示：" + fieldError.getDefaultMessage());
				System.out.println("错误的字段:" + fieldError.getField());
			}
			return "";
		} else {
			// 创建一个UUID方便插入的时候参入
			String uuid = UUID.randomUUID().toString().substring(0, 32);
			// 传入uuid到client对象
			client.setClientId(uuid);
			// 调用添加方法
			clientBiz.addClient(client);
			System.out.println(client);
			// 重定向到查询所有页面
			return "redirect:/client/finAllClient";
		}
	}
	
	
	/**
	 * .修改客户
	 * @param client
	 * @return
	 */
	@RequestMapping(value = "/updateClient", method = RequestMethod.PUT)
	public String updateClient(Client client,HttpServletRequest request) {
		clientBiz.updateClient(client);
		
		return "redirect:/client/finAllClient";
	}
	
	
	@RequestMapping(value = "/deleteClient/{cid}", method = RequestMethod.GET)
	public String deleteClient(@PathVariable(value = "cid")String cid) {
		System.out.println(cid);
		clientBiz.deleteClient(cid);
		
		return "redirect:/client/finAllClient";
		
	}

}
