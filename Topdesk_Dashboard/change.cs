//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Topdesk_Dashboard
{
    using System;
    using System.Collections.Generic;
    
    public partial class change
    {
        public change()
        {
            this.changeactivities = new HashSet<changeactivity>();
        }
    
        public Nullable<System.Guid> aanmelderafdelingid { get; set; }
        public Nullable<System.Guid> aanmelderbudgethouderid { get; set; }
        public string aanmelderemail { get; set; }
        public Nullable<System.Guid> aanmelderlokatieid { get; set; }
        public string aanmeldernaam { get; set; }
        public string aanmeldertelefoon { get; set; }
        public Nullable<System.Guid> aanmeldervestigingid { get; set; }
        public string action { get; set; }
        public Nullable<System.Guid> archivereasonid { get; set; }
        public Nullable<System.Guid> benefitid { get; set; }
        public Nullable<System.Guid> branchid { get; set; }
        public string briefdescription { get; set; }
        public int calc_type_authdate { get; set; }
        public int calc_type_finaldate { get; set; }
        public int calc_type_impldate { get; set; }
        public Nullable<System.DateTime> calldate { get; set; }
        public Nullable<System.Guid> categoryid { get; set; }
        public decimal currentplanexpenses { get; set; }
        public long currentplantimetaken { get; set; }
        public int changetype { get; set; }
        public bool closed { get; set; }
        public Nullable<System.DateTime> closeddate { get; set; }
        public string comments { get; set; }
        public bool completed { get; set; }
        public Nullable<System.DateTime> completeddate { get; set; }
        public int currentphase { get; set; }
        public Nullable<System.DateTime> dataanmk { get; set; }
        public Nullable<System.DateTime> datwijzig { get; set; }
        public string description { get; set; }
        public decimal estimateexpenses { get; set; }
        public long estimatetimetaken { get; set; }
        public Nullable<System.DateTime> finaldate { get; set; }
        public Nullable<System.Guid> eval_authoperatorid { get; set; }
        public Nullable<System.Guid> eval_authpersonid { get; set; }
        public decimal expenses { get; set; }
        public string externalnumber { get; set; }
        public Nullable<System.Guid> extraaid { get; set; }
        public Nullable<System.Guid> extraapersoonid { get; set; }
        public Nullable<System.Guid> extrabid { get; set; }
        public Nullable<System.Guid> extrabpersoonid { get; set; }
        public Nullable<System.Guid> impactid { get; set; }
        public int importtype { get; set; }
        public Nullable<System.Guid> incidentid { get; set; }
        public bool isurgent { get; set; }
        public Nullable<System.Guid> locationid { get; set; }
        public Nullable<System.Guid> managerid { get; set; }
        public Nullable<System.Guid> milestoneid { get; set; }
        public string number { get; set; }
        public Nullable<System.Guid> objectid { get; set; }
        public Nullable<System.Guid> operatorgroupid { get; set; }
        public Nullable<System.Guid> operatorid { get; set; }
        public decimal originalplanexpenses { get; set; }
        public long originalplantimetaken { get; set; }
        public Nullable<System.Guid> persoonid { get; set; }
        public Nullable<System.DateTime> plannedauthdate { get; set; }
        public Nullable<System.DateTime> plannedfinaldate { get; set; }
        public Nullable<System.DateTime> plannedimpldate { get; set; }
        public Nullable<System.DateTime> implementationdate { get; set; }
        public Nullable<System.Guid> pro_authoperatorid { get; set; }
        public Nullable<System.Guid> pro_authpersonid { get; set; }
        public Nullable<System.DateTime> rejecteddate { get; set; }
        public Nullable<System.Guid> rejectionreasonid { get; set; }
        public Nullable<System.DateTime> authorizationdate { get; set; }
        public Nullable<System.Guid> req_authoperatorid { get; set; }
        public Nullable<System.Guid> req_authpersonid { get; set; }
        public bool started { get; set; }
        public Nullable<System.DateTime> starteddate { get; set; }
        public int status { get; set; }
        public Nullable<System.Guid> statusid { get; set; }
        public Nullable<System.Guid> subcategoryid { get; set; }
        public Nullable<System.DateTime> submitdate { get; set; }
        public decimal sum_realizedexpenses { get; set; }
        public long sum_realizedtime { get; set; }
        public decimal sum_remainingexpenses { get; set; }
        public long sum_remainingtime { get; set; }
        public Nullable<System.Guid> templateid { get; set; }
        public long timetaken { get; set; }
        public Nullable<System.Guid> typeid { get; set; }
        public Nullable<System.Guid> uidaanmk { get; set; }
        public Nullable<System.Guid> uidwijzig { get; set; }
        public System.Guid unid { get; set; }
        public Nullable<System.Guid> versionid { get; set; }
        public bool withevaluation { get; set; }
        public Nullable<System.DateTime> vrijedatum1 { get; set; }
        public double vrijegetal1 { get; set; }
        public bool vrijelogisch1 { get; set; }
        public string vrijememo1 { get; set; }
        public Nullable<System.Guid> vrijeopzoek1 { get; set; }
        public string vrijetekst1 { get; set; }
        public Nullable<System.DateTime> vrijedatum2 { get; set; }
        public double vrijegetal2 { get; set; }
        public bool vrijelogisch2 { get; set; }
        public string vrijememo2 { get; set; }
        public Nullable<System.Guid> vrijeopzoek2 { get; set; }
        public string vrijetekst2 { get; set; }
        public Nullable<System.DateTime> vrijedatum3 { get; set; }
        public double vrijegetal3 { get; set; }
        public bool vrijelogisch3 { get; set; }
        public string vrijememo3 { get; set; }
        public Nullable<System.Guid> vrijeopzoek3 { get; set; }
        public string vrijetekst3 { get; set; }
        public Nullable<System.DateTime> vrijedatum4 { get; set; }
        public double vrijegetal4 { get; set; }
        public bool vrijelogisch4 { get; set; }
        public string vrijememo4 { get; set; }
        public Nullable<System.Guid> vrijeopzoek4 { get; set; }
        public string vrijetekst4 { get; set; }
        public Nullable<System.DateTime> vrijedatum5 { get; set; }
        public double vrijegetal5 { get; set; }
        public bool vrijelogisch5 { get; set; }
        public string vrijememo5 { get; set; }
        public Nullable<System.Guid> vrijeopzoek5 { get; set; }
        public string vrijetekst5 { get; set; }
        public Nullable<System.DateTime> attvrijedatum1 { get; set; }
        public double attvrijegetal1 { get; set; }
        public bool attvrijelogisch1 { get; set; }
        public string attvrijememo1 { get; set; }
        public Nullable<System.Guid> attvrijeopzoek1 { get; set; }
        public string attvrijetekst1 { get; set; }
        public Nullable<System.DateTime> attvrijedatum2 { get; set; }
        public double attvrijegetal2 { get; set; }
        public bool attvrijelogisch2 { get; set; }
        public string attvrijememo2 { get; set; }
        public Nullable<System.Guid> attvrijeopzoek2 { get; set; }
        public string attvrijetekst2 { get; set; }
        public Nullable<System.DateTime> attvrijedatum3 { get; set; }
        public double attvrijegetal3 { get; set; }
        public bool attvrijelogisch3 { get; set; }
        public string attvrijememo3 { get; set; }
        public Nullable<System.Guid> attvrijeopzoek3 { get; set; }
        public string attvrijetekst3 { get; set; }
        public Nullable<System.DateTime> attvrijedatum4 { get; set; }
        public double attvrijegetal4 { get; set; }
        public bool attvrijelogisch4 { get; set; }
        public string attvrijememo4 { get; set; }
        public Nullable<System.Guid> attvrijeopzoek4 { get; set; }
        public string attvrijetekst4 { get; set; }
        public Nullable<System.DateTime> attvrijedatum5 { get; set; }
        public double attvrijegetal5 { get; set; }
        public bool attvrijelogisch5 { get; set; }
        public string attvrijememo5 { get; set; }
        public Nullable<System.Guid> attvrijeopzoek5 { get; set; }
        public string attvrijetekst5 { get; set; }
        public int eval_decidedby { get; set; }
        public int pro_decidedby { get; set; }
        public Nullable<System.DateTime> plannedstartdate { get; set; }
        public int rejectedby { get; set; }
        public int canceledby { get; set; }
        public Nullable<System.Guid> canceledbypersonid { get; set; }
        public Nullable<System.Guid> canceledbyoperatorid { get; set; }
        public Nullable<System.Guid> cancelreasonid { get; set; }
        public Nullable<System.DateTime> canceldate { get; set; }
        public Nullable<System.Guid> priorityid { get; set; }
        public bool rejected { get; set; }
        public Nullable<System.DateTime> pro_rejecteddate { get; set; }
        public string bespokememo { get; set; }
        public bool mayauthorize_rfc { get; set; }
        public bool mayauthorize_pro { get; set; }
        public bool mayauthorize_eval { get; set; }
        public string importid { get; set; }
        public Nullable<System.DateTime> importdate { get; set; }
        public int publish_type { get; set; }
        public int publish_description_type { get; set; }
        public string publish_title { get; set; }
        public string publish_description { get; set; }
        public bool savedinsecure { get; set; }
        public string ref_type_name { get; set; }
        public string ref_category_name { get; set; }
        public string ref_subcategory_name { get; set; }
        public string ref_req_authoperator_name { get; set; }
        public string ref_pro_authoperator_name { get; set; }
        public string ref_eval_authoperator_name { get; set; }
        public string ref_operatorname { get; set; }
        public Nullable<System.Guid> appointmentid { get; set; }
    
        public virtual incident incident { get; set; }
        public virtual ICollection<changeactivity> changeactivities { get; set; }
    }
}
