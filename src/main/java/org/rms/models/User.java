package org.rms.models;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by bibin on 13/10/16.
 */

@Entity
@Table(name = "user")
public class User implements Serializable {

    private static final long serialVersionUID = 4953982568814652531L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "email")
    private String email;

    @Column(name = "password")
    private String password;

    public User() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
