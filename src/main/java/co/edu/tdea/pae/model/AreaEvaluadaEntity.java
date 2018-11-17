package co.edu.tdea.pae.model;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.persistence.*;
import java.util.List;


@Entity
@Table(name = "area_evaluada")
public class AreaEvaluadaEntity implements Cloneable {
    private Integer id;
    private String nombre;
    private String comentarios;
    private List<AnexoEntity> anexos;
    private List<ResponsableEntity> responsables;
    private List<AlimentoEntity> alimentos;
    private List<AspectoEvaluadoEntity> aspectosEvaluados;
    private String filePath;

    private EncabezadoLogisticaEntregaEntity encabezadoLogisticaEntrega;
    private EncabezadoBodegaEntity encabezadoBodega;
    private EncabezadoInstEducativaEntity encabezadoInstEducativa;
    private EncabezadoTransporteEntity encabezadoTransporte;

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
    @Column(name = "comentario")
    public String getComentarios() {
        return comentarios;
    }

    public void setComentarios(String comentarios) {
        this.comentarios = comentarios;
    }

    @Basic
    @Column(name = "file_path")
    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    @Override
    public Object clone() throws CloneNotSupportedException {
        AreaEvaluadaEntity areaEvaluadaEntity = new AreaEvaluadaEntity();
        areaEvaluadaEntity.setNombre(this.getNombre());
        areaEvaluadaEntity.setComentarios(this.getComentarios());
        areaEvaluadaEntity.setFilePath(this.getFilePath());
        areaEvaluadaEntity.setAnexos(this.getAnexos());
        areaEvaluadaEntity.setAspectosEvaluados(this.getAspectosEvaluados());
        areaEvaluadaEntity.setResponsables(this.getResponsables());
        areaEvaluadaEntity.setAlimentos(this.getAlimentos());
        areaEvaluadaEntity.setEncabezadoLogisticaEntrega(this.getEncabezadoLogisticaEntrega());
        areaEvaluadaEntity.setEncabezadoBodega(this.getEncabezadoBodega());
        areaEvaluadaEntity.setEncabezadoInstEducativa(this.getEncabezadoInstEducativa());
        areaEvaluadaEntity.setEncabezadoTransporte(this.getEncabezadoTransporte());
        return areaEvaluadaEntity;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        AreaEvaluadaEntity that = (AreaEvaluadaEntity) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (nombre != null ? !nombre.equals(that.nombre) : that.nombre != null) return false;
        return comentarios != null ? comentarios.equals(that.comentarios) : that.comentarios == null;

    }

    @Override
    public int hashCode() {
        int result = nombre != null ? nombre.hashCode() : 0;
        result = 31 * result + (comentarios != null ? comentarios.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "areaEvaluada", cascade = CascadeType.ALL, orphanRemoval = true)
    @LazyCollection(LazyCollectionOption.FALSE)
    public List<AnexoEntity> getAnexos() {
        return anexos;
    }

    public void setAnexos(List<AnexoEntity> anexos) {
        this.anexos = anexos;
    }

    @OneToMany(mappedBy = "areaEvaluada", cascade = CascadeType.ALL, orphanRemoval = true)
    @LazyCollection(LazyCollectionOption.FALSE)
    public List<AspectoEvaluadoEntity> getAspectosEvaluados() {
        return aspectosEvaluados;
    }

    public void setAspectosEvaluados(List<AspectoEvaluadoEntity> aspectosEvaluados) {
        this.aspectosEvaluados = aspectosEvaluados;
    }

    @OneToMany(mappedBy = "areaEvaluada", cascade = CascadeType.ALL, orphanRemoval = true)
    @LazyCollection(LazyCollectionOption.FALSE)
    public List<ResponsableEntity> getResponsables() {
        return responsables;
    }

    public void setResponsables(List<ResponsableEntity> responsables) {
        this.responsables = responsables;
    }

    @OneToMany(mappedBy = "areaEvaluada", cascade = CascadeType.ALL, orphanRemoval = true)
    @LazyCollection(LazyCollectionOption.FALSE)
    public List<AlimentoEntity> getAlimentos() {
        return alimentos;
    }

    public void setAlimentos(List<AlimentoEntity> alimentos) {
        this.alimentos = alimentos;
    }

    @OneToOne(cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name = "id_encabezado_logis_entrega", referencedColumnName = "id")
    public EncabezadoLogisticaEntregaEntity getEncabezadoLogisticaEntrega() {
        return encabezadoLogisticaEntrega;
    }

    public void setEncabezadoLogisticaEntrega(EncabezadoLogisticaEntregaEntity encabezadoLogisticaEntrega) {
        this.encabezadoLogisticaEntrega = encabezadoLogisticaEntrega;
    }

    @OneToOne(cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name = "id_encabezado_bodega", referencedColumnName = "id")
    public EncabezadoBodegaEntity getEncabezadoBodega() {
        return encabezadoBodega;
    }

    public void setEncabezadoBodega(EncabezadoBodegaEntity encabezadoBodega) {
        this.encabezadoBodega = encabezadoBodega;
    }

    @OneToOne(cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name = "id_encabezado_inst_educativa", referencedColumnName = "id")
    public EncabezadoInstEducativaEntity getEncabezadoInstEducativa() {
        return encabezadoInstEducativa;
    }

    public void setEncabezadoInstEducativa(EncabezadoInstEducativaEntity encabezadoInstEducativa) {
        this.encabezadoInstEducativa = encabezadoInstEducativa;
    }

    @OneToOne(cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name = "id_encabezado_transporte", referencedColumnName = "id")
    public EncabezadoTransporteEntity getEncabezadoTransporte() {
        return encabezadoTransporte;
    }

    public void setEncabezadoTransporte(EncabezadoTransporteEntity encabezadoTransporte) {
        this.encabezadoTransporte = encabezadoTransporte;
    }
}
