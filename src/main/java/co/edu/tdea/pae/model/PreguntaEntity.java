package co.edu.tdea.pae.model;

import javax.persistence.*;

@Entity
@Table(name = "pregunta")
public class PreguntaEntity {
    private Integer id;
    private String descripcion;

    @Id
    @Column(name = "id")
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Basic
    @Column(name = "descripcion")
    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        PreguntaEntity that = (PreguntaEntity) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        return descripcion != null ? descripcion.equals(that.descripcion) : that.descripcion == null;

    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (descripcion != null ? descripcion.hashCode() : 0);
        return result;
    }
}
