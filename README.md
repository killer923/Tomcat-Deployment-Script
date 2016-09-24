When using in tomcat in windows, you get some basic functionalities added due to nature of OS. These being :<br>
<ul>
	<li>Catalina logs being shown in new command prompt like window as soon as catalina.bat/startup.bat is run.</li>
	<li>When the newly opened window is closed, either via clicking 'X' button or using Ctrl+C, tomcat is shutdown.</li>
</ul>

I missed the above 'features' when I moved to Linux based OS. So I started using this script to start tomcat.<br/><br/>
Note that this script always starts the tomcat in debug mode with debug port at 8000.</br>
