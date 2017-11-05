package com.smsone.model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table
public class Owner implements Serializable
{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(nullable=false,unique = true)
	private Long oId;
	@Column(nullable=false,length=20)
	private String firstName;
	@Column(nullable=false,length=20)
	private String lastName;
	@Column(nullable=false,length=20)
	private String email;
	@Column(nullable=false,length=12,unique = true)
	private Long aadharNumber;
	@Column(nullable=false,length=10)
	private Long contactNumber;
	@Column(nullable=false,length=20)
	private String password;
	@OneToMany(cascade=CascadeType.ALL,fetch=FetchType.LAZY,mappedBy="owner")
	private Set<House> house;
	public Long getoId() {
		return oId;
	}
	public void setoId(Long oId) {
		this.oId = oId;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Long getAadharNumber() {
		return aadharNumber;
	}
	public void setAadharNumber(Long aadharNumber) {
		this.aadharNumber = aadharNumber;
	}
	public Long getContactNumber() {
		return contactNumber;
	}
	public void setContactNumber(Long contactNumber) {
		this.contactNumber = contactNumber;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Set<House> getHouse() {
		return house;
	}
	public void setHouse(Set<House> house) {
		this.house = house;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public Owner() {
		super();
	}
	public Owner(Long oId, String firstName, String lastName, String email, Long aadharNumber, Long contactNumber,
			String password, Set<House> house) {
		super();
		this.oId = oId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.aadharNumber = aadharNumber;
		this.contactNumber = contactNumber;
		this.password = password;
		this.house = house;
	}
	@Override
	public String toString() {
		return "Owner [oId=" + oId + ", firstName=" + firstName + ", lastName=" + lastName + ", email=" + email
				+ ", aadharNumber=" + aadharNumber + ", contactNumber=" + contactNumber + ", password=" + password
				+ ", house=" + house + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((aadharNumber == null) ? 0 : aadharNumber.hashCode());
		result = prime * result + ((contactNumber == null) ? 0 : contactNumber.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((firstName == null) ? 0 : firstName.hashCode());
		result = prime * result + ((house == null) ? 0 : house.hashCode());
		result = prime * result + ((lastName == null) ? 0 : lastName.hashCode());
		result = prime * result + ((oId == null) ? 0 : oId.hashCode());
		result = prime * result + ((password == null) ? 0 : password.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Owner other = (Owner) obj;
		if (aadharNumber == null) {
			if (other.aadharNumber != null)
				return false;
		} else if (!aadharNumber.equals(other.aadharNumber))
			return false;
		if (contactNumber == null) {
			if (other.contactNumber != null)
				return false;
		} else if (!contactNumber.equals(other.contactNumber))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (firstName == null) {
			if (other.firstName != null)
				return false;
		} else if (!firstName.equals(other.firstName))
			return false;
		if (house == null) {
			if (other.house != null)
				return false;
		} else if (!house.equals(other.house))
			return false;
		if (lastName == null) {
			if (other.lastName != null)
				return false;
		} else if (!lastName.equals(other.lastName))
			return false;
		if (oId == null) {
			if (other.oId != null)
				return false;
		} else if (!oId.equals(other.oId))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		return true;
	}
	
	
		
	
}