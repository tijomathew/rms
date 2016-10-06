package org.rms.models;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by bibin on 5/10/16.
 */

@Entity
@Table(name = "student_node")
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
    private String dayOne;

    @Column(name = "day_two")
    private String dayTwo;

    @Column(name = "day_three")
    private String dayThree;

    @Column(name = "day_four")
    private String dayFour;

    @ManyToOne(targetEntity = ParentNode.class, cascade = CascadeType.ALL, fetch = FetchType.LAZY)
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

    public ParentNode getParentNode() {
        return parentNode;
    }

    public void setParentNode(ParentNode parentNode) {
        this.parentNode = parentNode;
    }
}
