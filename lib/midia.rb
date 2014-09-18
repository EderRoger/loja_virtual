class Midia

	attr_accessor :valor
	attr_accessor :titulo

	def initialize
		@desconto = 0.1
		@valor = 10.0
	end

	def valor_com_desconto
		@valor - desconto
	end

	def to_s
       %Q{ Título: #{@titulo}, Valor: #{@valor} }
    end

    private 

    def desconto
    	@valor * @desconto
    end
end