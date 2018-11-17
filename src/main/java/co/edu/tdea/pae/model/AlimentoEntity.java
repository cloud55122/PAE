package co.edu.tdea.pae.model;

import javax.persistence.*;

@Entity
@Table(name = "alimento")
public class AlimentoEntity {
    private Integer id;
    private String marca;
    private Boolean snAprobacionGsan;
    private Boolean snCumpleMarcaComercial;
    private Boolean snCumpleEtiquetado;
    private Boolean snCumpleEmpaque;
    private AreaEvaluadaEntity areaEvaluada;
    private AlimentoRegistradoEntity alimentoRegistrado;

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
    @Column(name = "marca")
    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    @Basic
    @Column(name = "sn_aprobacion_gsan")
    public Boolean getSnAprobacionGsan() {
        return snAprobacionGsan;
    }

    public void setSnAprobacionGsan(Boolean snAprobacionGsan) {
        this.snAprobacionGsan = snAprobacionGsan;
    }

    @Basic
    @Column(name = "sn_cumple_marca_comercial")
    public Boolean getSnCumpleMarcaComercial() {
        return snCumpleMarcaComercial;
    }

    public void setSnCumpleMarcaComercial(Boolean snCumpleMarcaComercial) {
        this.snCumpleMarcaComercial = snCumpleMarcaComercial;
    }

    @Basic
    @Column(name = "sn_cumple_etiquetado")
    public Boolean getSnCumpleEtiquetado() {
        return snCumpleEtiquetado;
    }

    public void setSnCumpleEtiquetado(Boolean snCumpleEtiquetado) {
        this.snCumpleEtiquetado = snCumpleEtiquetado;
    }

    @Basic
    @Column(name = "sn_cumple_empaque")
    public Boolean getSnCumpleEmpaque() {
        return snCumpleEmpaque;
    }

    public void setSnCumpleEmpaque(Boolean snCumpleEmpaque) {
        this.snCumpleEmpaque = snCumpleEmpaque;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        AlimentoEntity that = (AlimentoEntity) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (marca != null ? !marca.equals(that.marca) : that.marca != null) return false;
        if (snAprobacionGsan != null ? !snAprobacionGsan.equals(that.snAprobacionGsan) : that.snAprobacionGsan != null)
            return false;
        if (snCumpleMarcaComercial != null ? !snCumpleMarcaComercial.equals(that.snCumpleMarcaComercial) : that.snCumpleMarcaComercial != null)
            return false;
        if (snCumpleEtiquetado != null ? !snCumpleEtiquetado.equals(that.snCumpleEtiquetado) : that.snCumpleEtiquetado != null)
            return false;
        return snCumpleEmpaque != null ? snCumpleEmpaque.equals(that.snCumpleEmpaque) : that.snCumpleEmpaque == null;

    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (marca != null ? marca.hashCode() : 0);
        result = 31 * result + (snAprobacionGsan != null ? snAprobacionGsan.hashCode() : 0);
        result = 31 * result + (snCumpleMarcaComercial != null ? snCumpleMarcaComercial.hashCode() : 0);
        result = 31 * result + (snCumpleEtiquetado != null ? snCumpleEtiquetado.hashCode() : 0);
        result = 31 * result + (snCumpleEmpaque != null ? snCumpleEmpaque.hashCode() : 0);
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

    @ManyToOne
    @JoinColumn(name = "id_alimento_registrado", referencedColumnName = "id", nullable = false)
    public AlimentoRegistradoEntity getAlimentoRegistrado() {
        return alimentoRegistrado;
    }

    public void setAlimentoRegistrado(AlimentoRegistradoEntity alimentoRegistrado) {
        this.alimentoRegistrado = alimentoRegistrado;
    }
}
