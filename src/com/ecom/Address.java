package com.ecom;

public class Address {
	String NickName;
	String AddressLine_1;
	String AddressLine_2;
	String City;
	String State;
	String Country;
	String ZipCode;
	
	public String getNickName() {
		return NickName;
	}

	public void setNickName(String nickName) {
		NickName = nickName;
	}

	public String getAddressLine_1() {
		return AddressLine_1;
	}

	public void setAddressLine_1(String addressLine_1) {
		AddressLine_1 = addressLine_1;
	}

	public String getAddressLine_2() {
		return AddressLine_2;
	}

	public void setAddressLine_2(String addressLine_2) {
		AddressLine_2 = addressLine_2;
	}

	public String getCity() {
		return City;
	}

	public void setCity(String city) {
		City = city;
	}

	public String getState() {
		return State;
	}

	public void setState(String state) {
		State = state;
	}

	public String getCountry() {
		return Country;
	}

	public void setCountry(String country) {
		Country = country;
	}

	public String getZipCode() {
		return ZipCode;
	}

	public void setZipCode(String zipCode) {
		ZipCode = zipCode;
	}

	@Override
	public String toString() {
		return  AddressLine_1 + " "+ City
				+ "  "+ State + " " + Country + " " + ZipCode ;
	}
	
	
}
