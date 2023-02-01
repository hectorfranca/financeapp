package Beans;

import Beans.RegistroBean;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2023-02-01T15:23:50")
@StaticMetamodel(ContaBean.class)
public class ContaBean_ { 

    public static volatile SingularAttribute<ContaBean, String> senha;
    public static volatile SetAttribute<ContaBean, RegistroBean> registros;
    public static volatile SingularAttribute<ContaBean, String> nome;
    public static volatile SingularAttribute<ContaBean, Long> id;
    public static volatile SingularAttribute<ContaBean, String> email;

}