<?xml version="1.0" encoding="UTF-8" standalone="yes" ?>
<!DOCTYPE boost_serialization>
<boost_serialization signature="serialization::archive" version="10">
<syndb class_id="0" tracking_level="0" version="0">
	<userIPLatency>-1</userIPLatency>
	<userIPName></userIPName>
	<cdfg class_id="1" tracking_level="1" version="0" object_id="_0">
		<name>add_ten</name>
		<ret_bitwidth>32</ret_bitwidth>
		<ports class_id="2" tracking_level="0" version="0">
			<count>2</count>
			<item_version>0</item_version>
			<item class_id="3" tracking_level="1" version="0" object_id="_1">
				<Value class_id="4" tracking_level="0" version="0">
					<Obj class_id="5" tracking_level="0" version="0">
						<type>1</type>
						<id>1</id>
						<name>input_r</name>
						<fileName></fileName>
						<fileDirectory></fileDirectory>
						<lineNumber>0</lineNumber>
						<contextFuncName></contextFuncName>
						<inlineStackInfo class_id="6" tracking_level="0" version="0">
							<count>0</count>
							<item_version>0</item_version>
						</inlineStackInfo>
						<originalName>input</originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>32</bitwidth>
				</Value>
				<direction>0</direction>
				<if_type>0</if_type>
				<array_size>0</array_size>
				<bit_vecs class_id="7" tracking_level="0" version="0">
					<count>0</count>
					<item_version>0</item_version>
				</bit_vecs>
			</item>
			<item class_id_reference="3" object_id="_2">
				<Value>
					<Obj>
						<type>1</type>
						<id>2</id>
						<name>output_r</name>
						<fileName></fileName>
						<fileDirectory></fileDirectory>
						<lineNumber>0</lineNumber>
						<contextFuncName></contextFuncName>
						<inlineStackInfo>
							<count>0</count>
							<item_version>0</item_version>
						</inlineStackInfo>
						<originalName>output</originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>32</bitwidth>
				</Value>
				<direction>1</direction>
				<if_type>0</if_type>
				<array_size>0</array_size>
				<bit_vecs>
					<count>0</count>
					<item_version>0</item_version>
				</bit_vecs>
			</item>
		</ports>
		<nodes class_id="8" tracking_level="0" version="0">
			<count>4</count>
			<item_version>0</item_version>
			<item class_id="9" tracking_level="1" version="0" object_id="_3">
				<Value>
					<Obj>
						<type>0</type>
						<id>10</id>
						<name>input_read</name>
						<fileName>add_ten.cpp</fileName>
						<fileDirectory>c:/Users/Ali/Documents/Research/HLS_IP/add_ten</fileDirectory>
						<lineNumber>11</lineNumber>
						<contextFuncName>add_ten</contextFuncName>
						<inlineStackInfo>
							<count>1</count>
							<item_version>0</item_version>
							<item class_id="10" tracking_level="0" version="0">
								<first>c:/Users/Ali/Documents/Research/HLS_IP/add_ten</first>
								<second class_id="11" tracking_level="0" version="0">
									<count>1</count>
									<item_version>0</item_version>
									<item class_id="12" tracking_level="0" version="0">
										<first class_id="13" tracking_level="0" version="0">
											<first>add_ten.cpp</first>
											<second>add_ten</second>
										</first>
										<second>11</second>
									</item>
								</second>
							</item>
						</inlineStackInfo>
						<originalName></originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>32</bitwidth>
				</Value>
				<oprand_edges>
					<count>2</count>
					<item_version>0</item_version>
					<item>17</item>
					<item>18</item>
				</oprand_edges>
				<opcode>read</opcode>
			</item>
			<item class_id_reference="9" object_id="_4">
				<Value>
					<Obj>
						<type>0</type>
						<id>11</id>
						<name>output_assign</name>
						<fileName>add_ten.cpp</fileName>
						<fileDirectory>c:/Users/Ali/Documents/Research/HLS_IP/add_ten</fileDirectory>
						<lineNumber>11</lineNumber>
						<contextFuncName>add_ten</contextFuncName>
						<inlineStackInfo>
							<count>1</count>
							<item_version>0</item_version>
							<item>
								<first>c:/Users/Ali/Documents/Research/HLS_IP/add_ten</first>
								<second>
									<count>1</count>
									<item_version>0</item_version>
									<item>
										<first>
											<first>add_ten.cpp</first>
											<second>add_ten</second>
										</first>
										<second>11</second>
									</item>
								</second>
							</item>
						</inlineStackInfo>
						<originalName></originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>32</bitwidth>
				</Value>
				<oprand_edges>
					<count>2</count>
					<item_version>0</item_version>
					<item>19</item>
					<item>21</item>
				</oprand_edges>
				<opcode>add</opcode>
			</item>
			<item class_id_reference="9" object_id="_5">
				<Value>
					<Obj>
						<type>0</type>
						<id>12</id>
						<name></name>
						<fileName>add_ten.cpp</fileName>
						<fileDirectory>c:/Users/Ali/Documents/Research/HLS_IP/add_ten</fileDirectory>
						<lineNumber>11</lineNumber>
						<contextFuncName>add_ten</contextFuncName>
						<inlineStackInfo>
							<count>1</count>
							<item_version>0</item_version>
							<item>
								<first>c:/Users/Ali/Documents/Research/HLS_IP/add_ten</first>
								<second>
									<count>1</count>
									<item_version>0</item_version>
									<item>
										<first>
											<first>add_ten.cpp</first>
											<second>add_ten</second>
										</first>
										<second>11</second>
									</item>
								</second>
							</item>
						</inlineStackInfo>
						<originalName></originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>0</bitwidth>
				</Value>
				<oprand_edges>
					<count>3</count>
					<item_version>0</item_version>
					<item>23</item>
					<item>24</item>
					<item>25</item>
				</oprand_edges>
				<opcode>write</opcode>
			</item>
			<item class_id_reference="9" object_id="_6">
				<Value>
					<Obj>
						<type>0</type>
						<id>14</id>
						<name></name>
						<fileName>add_ten.cpp</fileName>
						<fileDirectory>c:/Users/Ali/Documents/Research/HLS_IP/add_ten</fileDirectory>
						<lineNumber>12</lineNumber>
						<contextFuncName>add_ten</contextFuncName>
						<inlineStackInfo>
							<count>1</count>
							<item_version>0</item_version>
							<item>
								<first>c:/Users/Ali/Documents/Research/HLS_IP/add_ten</first>
								<second>
									<count>1</count>
									<item_version>0</item_version>
									<item>
										<first>
											<first>add_ten.cpp</first>
											<second>add_ten</second>
										</first>
										<second>12</second>
									</item>
								</second>
							</item>
						</inlineStackInfo>
						<originalName></originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>0</bitwidth>
				</Value>
				<oprand_edges>
					<count>1</count>
					<item_version>0</item_version>
					<item>27</item>
				</oprand_edges>
				<opcode>ret</opcode>
			</item>
		</nodes>
		<consts class_id="15" tracking_level="0" version="0">
			<count>2</count>
			<item_version>0</item_version>
			<item class_id="16" tracking_level="1" version="0" object_id="_7">
				<Value>
					<Obj>
						<type>2</type>
						<id>20</id>
						<name>empty</name>
						<fileName></fileName>
						<fileDirectory></fileDirectory>
						<lineNumber>0</lineNumber>
						<contextFuncName></contextFuncName>
						<inlineStackInfo>
							<count>0</count>
							<item_version>0</item_version>
						</inlineStackInfo>
						<originalName></originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>32</bitwidth>
				</Value>
				<const_type>0</const_type>
				<content>10</content>
			</item>
			<item class_id_reference="16" object_id="_8">
				<Value>
					<Obj>
						<type>2</type>
						<id>26</id>
						<name>empty</name>
						<fileName></fileName>
						<fileDirectory></fileDirectory>
						<lineNumber>0</lineNumber>
						<contextFuncName></contextFuncName>
						<inlineStackInfo>
							<count>0</count>
							<item_version>0</item_version>
						</inlineStackInfo>
						<originalName></originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>32</bitwidth>
				</Value>
				<const_type>0</const_type>
				<content>0</content>
			</item>
		</consts>
		<blocks class_id="17" tracking_level="0" version="0">
			<count>1</count>
			<item_version>0</item_version>
			<item class_id="18" tracking_level="1" version="0" object_id="_9">
				<Obj>
					<type>3</type>
					<id>15</id>
					<name>add_ten</name>
					<fileName></fileName>
					<fileDirectory></fileDirectory>
					<lineNumber>0</lineNumber>
					<contextFuncName></contextFuncName>
					<inlineStackInfo>
						<count>0</count>
						<item_version>0</item_version>
					</inlineStackInfo>
					<originalName></originalName>
					<rtlName></rtlName>
					<coreName></coreName>
				</Obj>
				<node_objs>
					<count>4</count>
					<item_version>0</item_version>
					<item>10</item>
					<item>11</item>
					<item>12</item>
					<item>14</item>
				</node_objs>
			</item>
		</blocks>
		<edges class_id="19" tracking_level="0" version="0">
			<count>6</count>
			<item_version>0</item_version>
			<item class_id="20" tracking_level="1" version="0" object_id="_10">
				<id>18</id>
				<edge_type>1</edge_type>
				<source_obj>1</source_obj>
				<sink_obj>10</sink_obj>
			</item>
			<item class_id_reference="20" object_id="_11">
				<id>19</id>
				<edge_type>1</edge_type>
				<source_obj>10</source_obj>
				<sink_obj>11</sink_obj>
			</item>
			<item class_id_reference="20" object_id="_12">
				<id>21</id>
				<edge_type>1</edge_type>
				<source_obj>20</source_obj>
				<sink_obj>11</sink_obj>
			</item>
			<item class_id_reference="20" object_id="_13">
				<id>24</id>
				<edge_type>1</edge_type>
				<source_obj>2</source_obj>
				<sink_obj>12</sink_obj>
			</item>
			<item class_id_reference="20" object_id="_14">
				<id>25</id>
				<edge_type>1</edge_type>
				<source_obj>11</source_obj>
				<sink_obj>12</sink_obj>
			</item>
			<item class_id_reference="20" object_id="_15">
				<id>27</id>
				<edge_type>1</edge_type>
				<source_obj>26</source_obj>
				<sink_obj>14</sink_obj>
			</item>
		</edges>
	</cdfg>
	<cdfg_regions class_id="21" tracking_level="0" version="0">
		<count>1</count>
		<item_version>0</item_version>
		<item class_id="22" tracking_level="1" version="0" object_id="_16">
			<mId>1</mId>
			<mTag>add_ten</mTag>
			<mType>0</mType>
			<sub_regions>
				<count>0</count>
				<item_version>0</item_version>
			</sub_regions>
			<basic_blocks>
				<count>1</count>
				<item_version>0</item_version>
				<item>15</item>
			</basic_blocks>
			<mII>-1</mII>
			<mDepth>-1</mDepth>
			<mMinTripCount>-1</mMinTripCount>
			<mMaxTripCount>-1</mMaxTripCount>
			<mMinLatency>0</mMinLatency>
			<mMaxLatency>-1</mMaxLatency>
			<mIsDfPipe>0</mIsDfPipe>
			<mDfPipe class_id="-1"></mDfPipe>
		</item>
	</cdfg_regions>
	<fsm class_id="-1"></fsm>
	<res class_id="25" tracking_level="1" version="0" object_id="_17">
		<dp_component_resource class_id="26" tracking_level="0" version="0">
			<count>0</count>
			<item_version>0</item_version>
		</dp_component_resource>
		<dp_expression_resource>
			<count>0</count>
			<item_version>0</item_version>
		</dp_expression_resource>
		<dp_fifo_resource>
			<count>0</count>
			<item_version>0</item_version>
		</dp_fifo_resource>
		<dp_memory_resource>
			<count>0</count>
			<item_version>0</item_version>
		</dp_memory_resource>
		<dp_multiplexer_resource>
			<count>0</count>
			<item_version>0</item_version>
		</dp_multiplexer_resource>
		<dp_register_resource>
			<count>0</count>
			<item_version>0</item_version>
		</dp_register_resource>
		<dp_component_map class_id="27" tracking_level="0" version="0">
			<count>0</count>
			<item_version>0</item_version>
		</dp_component_map>
		<dp_expression_map>
			<count>0</count>
			<item_version>0</item_version>
		</dp_expression_map>
		<dp_fifo_map>
			<count>0</count>
			<item_version>0</item_version>
		</dp_fifo_map>
		<dp_memory_map>
			<count>0</count>
			<item_version>0</item_version>
		</dp_memory_map>
	</res>
	<node_label_latency class_id="28" tracking_level="0" version="0">
		<count>4</count>
		<item_version>0</item_version>
		<item class_id="29" tracking_level="0" version="0">
			<first>10</first>
			<second class_id="30" tracking_level="0" version="0">
				<first>0</first>
				<second>0</second>
			</second>
		</item>
		<item>
			<first>11</first>
			<second>
				<first>0</first>
				<second>0</second>
			</second>
		</item>
		<item>
			<first>12</first>
			<second>
				<first>0</first>
				<second>0</second>
			</second>
		</item>
		<item>
			<first>14</first>
			<second>
				<first>0</first>
				<second>0</second>
			</second>
		</item>
	</node_label_latency>
	<bblk_ent_exit class_id="31" tracking_level="0" version="0">
		<count>1</count>
		<item_version>0</item_version>
		<item class_id="32" tracking_level="0" version="0">
			<first>15</first>
			<second class_id="33" tracking_level="0" version="0">
				<first>0</first>
				<second>0</second>
			</second>
		</item>
	</bblk_ent_exit>
	<regions class_id="34" tracking_level="0" version="0">
		<count>0</count>
		<item_version>0</item_version>
	</regions>
	<dp_fu_nodes class_id="35" tracking_level="0" version="0">
		<count>0</count>
		<item_version>0</item_version>
	</dp_fu_nodes>
	<dp_fu_nodes_expression class_id="36" tracking_level="0" version="0">
		<count>0</count>
		<item_version>0</item_version>
	</dp_fu_nodes_expression>
	<dp_fu_nodes_module>
		<count>0</count>
		<item_version>0</item_version>
	</dp_fu_nodes_module>
	<dp_fu_nodes_io>
		<count>0</count>
		<item_version>0</item_version>
	</dp_fu_nodes_io>
	<return_ports>
		<count>0</count>
		<item_version>0</item_version>
	</return_ports>
	<dp_mem_port_nodes class_id="37" tracking_level="0" version="0">
		<count>0</count>
		<item_version>0</item_version>
	</dp_mem_port_nodes>
	<dp_reg_nodes>
		<count>0</count>
		<item_version>0</item_version>
	</dp_reg_nodes>
	<dp_regname_nodes>
		<count>0</count>
		<item_version>0</item_version>
	</dp_regname_nodes>
	<dp_reg_phi>
		<count>0</count>
		<item_version>0</item_version>
	</dp_reg_phi>
	<dp_regname_phi>
		<count>0</count>
		<item_version>0</item_version>
	</dp_regname_phi>
	<dp_port_io_nodes class_id="38" tracking_level="0" version="0">
		<count>0</count>
		<item_version>0</item_version>
	</dp_port_io_nodes>
	<port2core class_id="39" tracking_level="0" version="0">
		<count>0</count>
		<item_version>0</item_version>
	</port2core>
	<node2core>
		<count>0</count>
		<item_version>0</item_version>
	</node2core>
</syndb>
</boost_serialization>

