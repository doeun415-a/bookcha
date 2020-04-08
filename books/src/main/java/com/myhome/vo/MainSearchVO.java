package com.myhome.vo;

import java.util.List;

public class MainSearchVO {
	private String place;
	private String placeDtl;
	private String service;
	@Override
	public String toString() {
		return "MainSearchVO [place=" + place + ", placeDtl=" + placeDtl + ", service=" + service + "]";
	}
	public MainSearchVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MainSearchVO(String place, String placeDtl, String service) {
		super();
		this.place = place;
		this.placeDtl = placeDtl;
		this.service = service;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getPlaceDtl() {
		return placeDtl;
	}
	public void setPlaceDtl(String placeDtl) {
		this.placeDtl = placeDtl;
	}
	public String getService() {
		return service;
	}
	public void setService(String service) {
		this.service = service;
	}



}
