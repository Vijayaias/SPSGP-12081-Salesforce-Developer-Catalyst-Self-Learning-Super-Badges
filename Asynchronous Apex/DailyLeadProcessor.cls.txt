public class DailyLeadProcessor implements Schedulable {
    
    public void execute(SchedulableContext ctx) {
        List<Lead> leads = [select Id, LeadSource from Lead where LeadSource = '' LIMIT 200];
        if(leads.size()>0){
            List<Lead>newLeads= new List<Lead>();
            for(Lead lead: leads){
                lead.LeadSource='DreamForce';
                newLeads.add(lead);
                
            }
            update newLeads;
        }
    }
}