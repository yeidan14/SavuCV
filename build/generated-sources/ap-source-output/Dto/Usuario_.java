package Dto;

import Dto.Datosper;
import Dto.EdSuperior;
import Dto.Expelab;
import Dto.Fbasica;
import Dto.Idioma;
import Dto.Obervaciones;
import Dto.Tiemexp;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-11-09T23:33:26")
@StaticMetamodel(Usuario.class)
public class Usuario_ { 

    public static volatile SingularAttribute<Usuario, String> password;
    public static volatile SingularAttribute<Usuario, Tiemexp> tiemexp;
    public static volatile SingularAttribute<Usuario, Datosper> datosper;
    public static volatile SingularAttribute<Usuario, Obervaciones> obervaciones;
    public static volatile ListAttribute<Usuario, Idioma> idiomaList;
    public static volatile ListAttribute<Usuario, EdSuperior> edSuperiorList;
    public static volatile SingularAttribute<Usuario, String> usuario;
    public static volatile SingularAttribute<Usuario, Fbasica> fbasica;
    public static volatile ListAttribute<Usuario, Expelab> expelabList;
    public static volatile SingularAttribute<Usuario, String> email;

}