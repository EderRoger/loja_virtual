class Relatorio
	def initialize(biblioteca)
		@biblioteca = biblioteca
	end

	def total
		#soma = 0.0
		#@biblioteca.livros.each do |livro|
		#	soma += livro.preco
		#end
		#soma
		#idiomatic way
		#@biblioteca.livros.inject(0) { |tot, livro| tot += livro.preco }
		#more simplified
		#@biblioteca.livros.map(&:preco).inject(0){ |tot, preco| tot += preco }
		# more more simplified.. i love this..
		@biblioteca.livros.map(&:preco).inject(:+)
	end

	def titulos
		#titulos = []

		#@biblioteca.livros.each do |livro|
        #	titulos << livro.titulo 
		#end 
		#titulos
		#idiomatic way
		#@biblioteca.livros.map &:titulo
		@biblioteca.livros.map{ |livro| livro.titulo }
	end


end