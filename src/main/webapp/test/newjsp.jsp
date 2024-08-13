<%-- 
    Document   : newjsp
    Created on : 12 ago 2024, 21:38:28
    Author     : KiRoS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>



        <sql:query var="datos_paciente2" dataSource="jdbc/HIMFG">
            select top 1
            isnull(PA.cPaterno,'') as ap_paterno ,
            isnull(PA.cMaterno,'00') as ap_materno,
            isnull(PA. cNombre,'') as nombre,
            isnull(PA. cSexo,'') as sexo,
            isnull(PA.cEdoNacimiento,'99') as edo_nac ,
            isnull(ES. cNombre,'SE DESCONOCE')as edo_nacdesc,
            isnull(PA.IDEdoCivil,'-1') as edocivil,
            isnull( C.cDescripcion,'Se Ignora') as E_Civildesc,
            isnull(PA.IDEscolaridad,'-1')as id_escolar,
            isnull(S.cDescripcion,'SE IGNORA') as Desc_Esc,
            isnull(DR.IDTipoDerechohabiente,'00') as dhab,
            isnull(TD.cDescripcion,'NINGUNA') as dec_dh,
            isnull(PA.IDReligion,'-1') as id_relig,
            isnull(R.cDescripcion, 'CATOLICA') as desc_relig,
            isnull(DP.IDEstado,'99') as id_edo,
            isnull(ES2. cNombre,'SE DESCONOCE') as desc_edo,
            isnull(DP.IDMunicipio,'999') as id_munic,
            isnull(MU.cNombre,'SE IGNORA') as desc_mun,
            isnull(DP.IDLocalidad,'9999') as idlocalidad ,
            isnull(LO.cNombre,'SE IGNORA') as desc_localid,
            isnull(DP.cColonia,'') as colonia,
            isnull(DP.cCalle,'') as calle,
            isnull(convert(varchar, PA.dfechanacimiento, 112),'') as fnacimiento,
            isnull(DP.cNumInterior,'') as num_int,
            isnull(DP.cNumExterior,'') as num_ext,
            isnull(DP.cCP, '')as cp,
            isnull(DP.cEntreCalles,'') as ent_calles, 
            isnull(CL.curp_aamates,'') as curp_aamates
            FROM   CTL_Pacientes AS PA LEFT OUTER JOIN
            Expedientes AS EX ON EX.IDPaciente = PA.IDPaciente LEFT OUTER JOIN
            HIM_Clientes AS CL ON CAST(IDExpediente AS varchar(50)) = CL.folio LEFT OUTER JOIN    
            Det_Pacientes_Derechohabiencia AS DR ON DR.IDPaciente = PA.IDPaciente LEFT OUTER JOIN
            Ctl_TipoDerechohabiencia AS TD ON TD.IDTipoDerechohabiente = DR.IDTipoDerechohabiente
            LEFT OUTER JOIN  Ctl_Estados AS ES ON ES.IDEstado = PA.cEdoNacimiento LEFT OUTER JOIN
            Ctl_EstadoCiviL AS C ON C.IDEdoCivil = PA.IDEdoCivil LEFT OUTER JOIN
            Ctl_Escolaridades AS S ON S.IDEscolaridad = PA.IDEscolaridad LEFT OUTER JOIN
            Ctl_Ocupaciones AS O ON O.IDOcupacion = PA.IDOcupacion LEFT OUTER JOIN
            Ctl_Religiones AS R ON R.IDReligion = PA.IDReligion LEFT OUTER JOIN
            Det_DomicilioPacientes AS DP ON DP.IDPaciente = PA.IDPaciente LEFT OUTER JOIN
            Ctl_Estados AS ES2 ON ES2.IDEstado = DP.IDEstado  LEFT OUTER JOIN
            Ctl_Municipios AS MU ON MU.IDEstado = DP.IDEstado  AND MU.IDMunicipio = DP.IDMunicipio LEFT OUTER JOIN
            Ctl_Localidades AS LO ON LO.IDEstado = DP.IDEstado AND LO.IDMunicipio = DP.IDMunicipio  AND LO.IDLocalidad= DP.IDLocalidad
            
        </sql:query>

        <c:set var="edo_nac" value="${datos_paciente2.rows[0].edo_nac}"/>
        <c:set var="id_escolar" value="${datos_paciente2.rows[0].id_escolar}"/>
        <c:set var="edocivil" value="${datos_paciente2.rows[0].edocivil}"/>
        <c:set var="dhab" value="${datos_paciente2.rows[0].dhab}"/>
        <c:set var="id_relig" value="${datos_paciente2.rows[0].id_relig}"/>
        <c:set var="id_edo" value="${datos_paciente2.rows[0].id_edo}"/>
        <c:set var="id_munic" value="${datos_paciente2.rows[0].id_munic}"/>
        <c:set var="idlocalidad" value="${datos_paciente2.rows[0].idlocalidad}"/>
        <c:set var="colonia" value="${datos_paciente2.rows[0].colonia}"/>
        <c:set var="calle" value="${datos_paciente2.rows[0].calle}"/>
        <c:set var="num_int" value="${datos_paciente2.rows[0].num_int}"/>
        <c:set var="num_ext" value="${datos_paciente2.rows[0].num_ext}"/>
        <c:set var="cp" value="${datos_paciente2.rows[0].cp}"/>
        <c:set var="ent_calles" value="${datos_paciente2.rows[0].ent_calles}"/>
        <c:set var="fnacimiento" value="${datos_paciente2.rows[0].fnacimiento}"/>
        <c:set var="ap_paterno" value="${datos_paciente2.rows[0].ap_paterno}"/>
        <c:set var="ap_materno" value="${datos_paciente2.rows[0].ap_materno}"/>
        <c:set var="nombre" value="${datos_paciente2.rows[0].nombre}"/>
        <c:set var="sexo" value="${datos_paciente2.rows[0].sexo}"/>
        <c:set var="curp_aamates" value="${datos_paciente2.rows[0].curp_aamates}"/>

        <h1>Hello World!</h1> ${ap_materno} ${nombre}(${expe})
    </body>
</html>
