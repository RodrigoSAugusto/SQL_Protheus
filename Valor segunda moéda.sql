

select * from SB2010

--begin transaction
--update SB2010 set	B2_VATU2 = '0', B2_VATU3 = '0', B2_VATU4 = '0', B2_VATU5 = '0', 
					B2_VFIM2 = '0', B2_VFIM3 = '0', B2_VFIM4 = '0', B2_VFIM5 = '0',
					B2_CM2 = '0', B2_CM3 = '0', B2_CM4 = '0', B2_CM5 = '0'
					
					
					where B2_FILIAL = '010101'

--commit