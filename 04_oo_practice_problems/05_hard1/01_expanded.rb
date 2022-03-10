# Alyssa has been assigned a task of modifying a class that was initially created to keep track of secret information. 
# The new requirement calls for adding logging, when clients of the class attempt to access the secret data. Here is the class in its current form:

class SecretFile
  attr_reader :security_logger

  def initialize(secret_data, security_logger)
    @data = secret_data
    @security_logger = security_logger 
  end

  def data
    security_logger.create_log_entry
    @data
  end

end

# She needs to modify it so that any access to data must result in a log entry being generated. 
# That is, any call to the class which will result in data being returned must first call a logging class. 
# The logging class has been supplied to Alyssa and looks like the following:

class SecurityLogger
  def initialize
    @log_entries = []
  end

  def create_log_entry
    @log_entries << Time.new
  end
end

my_file = SecretFile.new('dumbledore dies', SecurityLogger.new)
p my_file.data
p my_file.security_logger
p my_file.data
p my_file.security_logger

# Hint: Assume that you can modify the initialize method in SecretFile to have an instance of SecurityLogger be passed in as an additional argument. 
# It may be helpful to review the lecture on collaborator objects for this practice problem.