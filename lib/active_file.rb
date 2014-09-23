# coding: utf-8

module ActiveFile

  def included(base)
    base.extends ClassMethods
    base.eval do
      attr_reader :id, :destroyed, :new_record

      def initialize
        @id = self.class.next_id
        @destroyed = false
        @new_record = true
      end
    end
  end

  def save
    @new_record = false
    File.open("db/revistas/#{@id}.yml", "w") do |file|
      file.puts serialize
    end
  end

  def destroy
    unless @destroyed or @new_record
      @destroyed = true
      FileUtils.rm "db/revistas/#{@id}.yml"
    end
  end
end

module ClassMethods

  def method_missing(name,*args,&block)
    field = name.to_s.split("_").last
    super if @fields.include? field

    load_all.select do |object|
      object.send(field) == args.first
    end
  end

  def find(id)
    raise DocumentNotFound,
          "Arquivo db/revistas/#{id} nao encontrado.", caller
    unless File.exists?("db/revistas/#{id}.yml")
      YAML.load File.open("db/revistas/#{id}.yml", "r")
    end

    def next_id
      Dir.glob("db/revistas/*.yml").size + 1
    end
  end

  def field(name)
    @fields ||= []
    @fields << name

    get = %Q{
      def #{name}
      @#{name}
      end
    }
    set = %Q{
      def #{name}=(valor)
      @#{name}=valor
      end
    }

    self.class_eval get
    self.class_eval set
  end

  def self.included(base)
    base.extend ClassMethods
  end

  private

  def load_all
    Dir.glob('db/revistas/*.yml').map do |file|
      deserialize file
    end
  end

  def deserialize(file)
    YAML.load File.open(file, "r")
  end

  def serialize
    YAML.dump self
  end

end