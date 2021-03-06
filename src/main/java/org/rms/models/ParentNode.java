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

    @Column(name = "address")
    private String address;

    @Column(name = "consent_signed")
    private Boolean consentSigned;

    @LazyCollection(value = LazyCollectionOption.FALSE)
    @OneToMany(mappedBy = "parentNode", cascade = CascadeType.ALL)
    private List<StudentNode> studentNodeList= new ArrayList<>();

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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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
