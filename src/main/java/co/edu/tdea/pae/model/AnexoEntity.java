package co.edu.tdea.pae.model;

import javax.persistence.*;
import java.awt.*;
import java.util.Arrays;

@Entity
@Table(name = "anexo")
public class AnexoEntity {
    private Integer id;
    private String nombre;
    private byte[] foto;
    private Image fotoJasper;
    private AreaEvaluadaEntity areaEvaluada;

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Basic
    @Column(name = "nombre")
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @Basic
    @Column(name = "foto", columnDefinition = "mediumblob")
    public byte[] getFoto() {
        return foto;
    }

    public void setFoto(byte[] foto) {
        this.foto = foto;
    }

    @Transient
    public Image getFotoJasper() {
        return fotoJasper;
    }

    public void setFotoJasper(Image fotoJasper) {
        this.fotoJasper = fotoJasper;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        AnexoEntity that = (AnexoEntity) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (nombre != null ? !nombre.equals(that.nombre) : that.nombre != null) return false;
        return Arrays.equals(foto, that.foto);

    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (nombre != null ? nombre.hashCode() : 0);
        result = 31 * result + Arrays.hashCode(foto);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "id_area_evaluada", referencedColumnName = "id", nullable = false)
    public AreaEvaluadaEntity getAreaEvaluada() {
        return areaEvaluada;
    }

    public void setAreaEvaluada(AreaEvaluadaEntity areaEvaluada) {
        this.areaEvaluada = areaEvaluada;
    }
}
