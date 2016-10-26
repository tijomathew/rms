package org.rms.models;

import org.apache.commons.lang3.StringUtils;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

/**
 * Created by bibin on 5/10/16.
 */

@Entity
@Table(name = "child_node")
public class StudentNode implements Serializable {

    private static final long serialVersionUID = 7450539180039911995L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "last_name")
    private String lastName;

    @Column(name = "class_division")
    private String classDivision;

    @Column(name = "retreat_section")
    private String retreatSection;

    @Column(name = "day_one")
    private String dayOne = StringUtils.EMPTY;

    @Column(name = "day_two")
    private String dayTwo = StringUtils.EMPTY;

    @Column(name = "day_three")
    private String dayThree = StringUtils.EMPTY;

    @Column(name = "day_four")
    private String dayFour = StringUtils.EMPTY;

    @Column(name = "band_code")
    private String bandCode;

    @ManyToOne(targetEntity = ParentNode.class)
    @JoinColumn(name = "parent_student_id", referencedColumnName = "id")
    private ParentNode parentNode;

    public StudentNode() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public String getClassDivision() {
        return classDivision;
    }

    public void setClassDivision(String classDivision) {
        this.classDivision = classDivision;
    }

    public String getRetreatSection() {
        return retreatSection;
    }

    public void setRetreatSection(String retreatSection) {
        this.retreatSection = retreatSection;
    }

    public String getDayOne() {
        return dayOne;
    }

    public void setDayOne(String dayOne) {
        this.dayOne = dayOne;
    }

    public String getDayTwo() {
        return dayTwo;
    }

    public void setDayTwo(String dayTwo) {
        this.dayTwo = dayTwo;
    }

    public String getDayThree() {
        return dayThree;
    }

    public void setDayThree(String dayThree) {
        this.dayThree = dayThree;
    }

    public String getDayFour() {
        return dayFour;
    }

    public void setDayFour(String dayFour) {
        this.dayFour = dayFour;
    }

    public String getBandCode() {
        return bandCode;
    }

    public void setBandCode(String bandCode) {
        this.bandCode = bandCode;
    }

    public ParentNode getParentNode() {
        return parentNode;
    }

    public void setParentNode(ParentNode parentNode) {
        this.parentNode = parentNode;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        StudentNode that = (StudentNode) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (parentNode != null ? !parentNode.equals(that.parentNode) : that.parentNode != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (parentNode != null ? parentNode.hashCode() : 0);
        return result;
    }
}
