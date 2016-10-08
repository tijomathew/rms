package org.rms.models;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;
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
    private String phoneNumber;

    @Column(name = "alternative_phone_number")
    private String alternativePhoneNumber;

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

    @Column(name = "consent_signed")
    private Boolean consentSigned;

    @Column(name = "medical_info_flag")
    private Boolean medicalInfoFlag;

    @Column(name = "medical_information")
    private String medicalInformation;

    @Column(name = "email_sent")
    private Boolean emailSent;

    @Column(name = "registered_date")
    private Date registeredDate;

    @Column(name = "registered_ip")
    private String ip;

    @Column(name = "band_code")
    private String bandCode;

    private transient String confirmEmail;

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

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAlternativePhoneNumber() {
        return alternativePhoneNumber;
    }

    public void setAlternativePhoneNumber(String alternativePhoneNumber) {
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

    public Boolean getConsentSigned() {
        return consentSigned;
    }

    public void setConsentSigned(Boolean consentSigned) {
        this.consentSigned = consentSigned;
    }

    public Boolean getMedicalInfoFlag() {
        return medicalInfoFlag;
    }

    public void setMedicalInfoFlag(Boolean medicalInfoFlag) {
        this.medicalInfoFlag = medicalInfoFlag;
    }

    public String getMedicalInformation() {
        return medicalInformation;
    }

    public void setMedicalInformation(String medicalInformation) {
        this.medicalInformation = medicalInformation;
    }

    public Boolean getEmailSent() {
        return emailSent;
    }

    public void setEmailSent(Boolean emailSent) {
        this.emailSent = emailSent;
    }

    public Date getRegisteredDate() {
        return registeredDate;
    }

    public void setRegisteredDate(Date registeredDate) {
        this.registeredDate = registeredDate;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getConfirmEmail() {
        return confirmEmail;
    }

    public void setConfirmEmail(String confirmEmail) {
        this.confirmEmail = confirmEmail;
    }

    public List<StudentNode> getStudentNodeList() {
        return studentNodeList;
    }

    public void setStudentNodeList(List<StudentNode> studentNodeList) {
        this.studentNodeList = studentNodeList;
    }
}
