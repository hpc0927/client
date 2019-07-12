package com.yidu.hpc.domain;

import java.io.Serializable;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;



/**
 *  .客户实体类
 * @author Administrator
 *
 */
public class Client implements Serializable {

	/**
	 *  .序列化
	 */
	private static final long serialVersionUID = 8819629806305483132L;

	
	private String clientId;
	@NotEmpty(message = "客户名不能为空")
	private String clientName;
	@NotEmpty(message = "客户手机不能为空")
	@Pattern(regexp="^\\s{0}$|^((17[0-9])|(14[0-9])|(13[0-9])|(15[^4,\\D])|(19[^4,\\D])|(18[0,1,2,5-9]))\\d{8}$",message = "请正确输入手机号")
	private String clientPhone;
	@NotEmpty(message = "客户地址不能为空")
	private String address;
	private String linkman;
	@Pattern(regexp="^\\s{0}$|^((17[0-9])|(14[0-9])|(13[0-9])|(15[^4,\\D])|(19[^4,\\D])|(18[0,1,2,5-9]))\\d{8}$",message = "请正确输入手机号")
	private String linkmanPhone;
	private String linkmanAddress;
	private Integer userable;
	private String description;
	private String remark1;
	private String remark2;

	public Client() {
		super();
	}

	public Client(String clientId, String clientName, String clientPhone, String address, String linkman,
			String linkmanPhone, String linkmanAddress, Integer userable, String description, String remark1,
			String remark2) {
		super();
		this.clientId = clientId;
		this.clientName = clientName;
		this.clientPhone = clientPhone;
		this.address = address;
		this.linkman = linkman;
		this.linkmanPhone = linkmanPhone;
		this.linkmanAddress = linkmanAddress;
		this.userable = userable;
		this.description = description;
		this.remark1 = remark1;
		this.remark2 = remark2;
	}

	public String getClientId() {
		return clientId;
	}

	public void setClientId(String clientId) {
		this.clientId = clientId;
	}

	public String getClientName() {
		return clientName;
	}

	public void setClientName(String clientName) {
		this.clientName = clientName;
	}

	public String getClientPhone() {
		return clientPhone;
	}

	public void setClientPhone(String clientPhone) {
		this.clientPhone = clientPhone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLinkman() {
		return linkman;
	}

	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}

	public String getLinkmanPhone() {
		return linkmanPhone;
	}

	public void setLinkmanPhone(String linkmanPhone) {
		this.linkmanPhone = linkmanPhone;
	}

	public String getLinkmanAddress() {
		return linkmanAddress;
	}

	public void setLinkmanAddress(String linkmanAddress) {
		this.linkmanAddress = linkmanAddress;
	}

	public Integer getUserable() {
		return userable;
	}

	public void setUserable(Integer userable) {
		this.userable = userable;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getRemark1() {
		return remark1;
	}

	public void setRemark1(String remark1) {
		this.remark1 = remark1;
	}

	public String getRemark2() {
		return remark2;
	}

	public void setRemark2(String remark2) {
		this.remark2 = remark2;
	}

	@Override
	public String toString() {
		return "Client [clientId=" + clientId + ", clientName=" + clientName + ", clientPhone=" + clientPhone
				+ ", address=" + address + ", linkman=" + linkman + ", linkmanPhone=" + linkmanPhone
				+ ", linkmanAddress=" + linkmanAddress + ", userable=" + userable + ", description=" + description
				+ ", remark1=" + remark1 + ", remark2=" + remark2 + "]";
	}

}
