package org.rms.models;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by bibin on 5/10/16.
 */

@Entity
@Table(name = "parent_node")
public class ParentNode implements Serializable {

    private static final long serialVersionUID = -2208418430551276985L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "masscentre_name")
    private String massCentreName;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "last_name")
    private String lastName;

    @Column(name = "phone_number")
    private Long phoneNumber;

    @Column(name = "alternative_phone_number")
    private Long alternativePhoneNumber;

    @Column(name = "email")
    private String email;

    @Column(name = "house_no")
    private String houseNo;

    @Column(name = "address_line_one")
    private String addressLineOne;

    @Column(name = "address_line_two")
    private String addressLineTwo;

    @Column(name = "address_line_three")
    private String addressLineThree;

    @Column(name = "county")
    private String county;

    @Column(name = "consent_signed")
    private Boolean consentSigned;

    @LazyCollection(value = LazyCollectionOption.FALSE)
    @OneToMany(mappedBy = "parentNode", cascade = CascadeType.ALL)
    private List<StudentNode> studentNodeList = new ArrayList<>();

    public ParentNode() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getMassCentreName() {
        return massCentreName;
    }

    public void setMassCentreName(String massCentreName) {
        this.massCentreName = massCentreName;
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

    public Long getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(Long phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Long getAlternativePhoneNumber() {
        return alternativePhoneNumber;
    }

    public void setAlternativePhoneNumber(Long alternativePhoneNumber) {
        this.alternativePhoneNumber = alternativePhoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getHouseNo() {
        return houseNo;
    }

    public void setHouseNo(String houseNo) {
        this.houseNo = houseNo;
    }

    public String getAddressLineOne() {
        return addressLineOne;
    }

    public void setAddressLineOne(String addressLineOne) {
        this.addressLineOne = addressLineOne;
    }

    public String getAddressLineTwo() {
        return addressLineTwo;
    }

    public void setAddressLineTwo(String addressLineTwo) {
        this.addressLineTwo = addressLineTwo;
    }

    public String getAddressLineThree() {
        return addressLineThree;
    }

    public void setAddressLineThree(String addressLineThree) {
        this.addressLineThree = addressLineThree;
    }

    public String getCounty() {
        return county;
    }

    public void setCounty(String county) {
        this.county = county;
    }

    public Boolean getConsentSigned() {
        return consentSigned;
    }

    public void setConsentSigned(Boolean consentSigned) {
        this.consentSigned = consentSigned;
    }

    public List<StudentNode> getStudentNodeList() {
        return studentNodeList;
    }

    public void setStudentNodeList(List<StudentNode> studentNodeList) {
        this.studentNodeList = studentNodeList;
    }
}
