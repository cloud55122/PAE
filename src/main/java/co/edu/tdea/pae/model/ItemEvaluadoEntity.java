package co.edu.tdea.pae.model;

import javax.persistence.*;

@Entity
@Table(name = "item_evaluado")
public class ItemEvaluadoEntity implements Comparable<ItemEvaluadoEntity> {
    private Integer id;
    private String observaciones;
    private AspectoEvaluadoEntity aspectoEvaluado;
    private PreguntaEntity pregunta;
    private EstadoPreguntaEntity estadoPregunta;

    @Override
    public int compareTo(ItemEvaluadoEntity o) {
        if (this.pregunta.getId() < o.pregunta.getId()) {
            return -1;
        }
        if (this.pregunta.getId() > o.pregunta.getId()) {
            return 1;
        }
        return 0;
    }
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
    @Column(name = "observaciones")
    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ItemEvaluadoEntity that = (ItemEvaluadoEntity) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        return observaciones != null ? observaciones.equals(that.observaciones) : that.observaciones == null;

    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (observaciones != null ? observaciones.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "id_aspecto_evaluado", referencedColumnName = "id", nullable = false)
    public AspectoEvaluadoEntity getAspectoEvaluado() {
        return aspectoEvaluado;
    }

    public void setAspectoEvaluado(AspectoEvaluadoEntity aspectoEvaluado) {
        this.aspectoEvaluado = aspectoEvaluado;
    }

    @ManyToOne
    @JoinColumn(name = "id_pregunta", referencedColumnName = "id", nullable = false)
    public PreguntaEntity getPregunta() {
        return pregunta;
    }

    public void setPregunta(PreguntaEntity pregunta) {
        this.pregunta = pregunta;
    }

    @ManyToOne
    @JoinColumn(name = "id_estado_pregunta", referencedColumnName = "id")
    public EstadoPreguntaEntity getEstadoPregunta() {
        return estadoPregunta;
    }

    public void setEstadoPregunta(EstadoPreguntaEntity estadoPregunta) {
        this.estadoPregunta = estadoPregunta;
    }
}
