class Doctor
  attr_accessor :name, :appointments, :patient
  @@all=[]

  def initialize(name)
    @name = name
    @appointments = []
    @@all << self
  end

  def self.all
    @@all
  end

  def appointments
    Appointment.all.select {|appointment| appointment.doctor == self}
  end

  def new_appointment(date, patient)
    appointment = Appointment.new(date, patient, self)
  end

  def patients
    self.appointments.collect do |appointment|
      appointment.patient
    end
  end
end
