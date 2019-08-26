package kr.co.realty.schedule;


import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

public class ScheduleVocAlertBean extends QuartzJobBean{
	
	private ScheduleVocAlertTask scheduleVocAlertTask;
	

	@Override
	protected void executeInternal(JobExecutionContext context) throws JobExecutionException {
		// TODO Auto-generated method stub
		scheduleVocAlertTask.scheduleVocAlert();
	}
	
	public void setScheduleVocAlertTask(ScheduleVocAlertTask scheduleVocAlertTask){
		this.scheduleVocAlertTask = scheduleVocAlertTask; 
	}
}
