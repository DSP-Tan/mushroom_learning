Á 
Û
D
AddV2
x"T
y"T
z"T"
Ttype:
2	
^
AssignVariableOp
resource
value"dtype"
dtypetype"
validate_shapebool( 
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
8
Const
output"dtype"
valuetensor"
dtypetype

Conv2D

input"T
filter"T
output"T"
Ttype:	
2"
strides	list(int)"
use_cudnn_on_gpubool(",
paddingstring:
SAMEVALIDEXPLICIT""
explicit_paddings	list(int)
 "-
data_formatstringNHWC:
NHWCNCHW" 
	dilations	list(int)

.
Identity

input"T
output"T"	
Ttype
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	

MaxPool

input"T
output"T"
Ttype0:
2	"
ksize	list(int)(0"
strides	list(int)(0",
paddingstring:
SAMEVALIDEXPLICIT""
explicit_paddings	list(int)
 ":
data_formatstringNHWC:
NHWCNCHWNCHW_VECT_C
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(
?
Mul
x"T
y"T
z"T"
Ttype:
2	

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
@
ReadVariableOp
resource
value"dtype"
dtypetype
E
Relu
features"T
activations"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
?
Select
	condition

t"T
e"T
output"T"	
Ttype
H
ShardedFilename
basename	
shard

num_shards
filename
0
Sigmoid
x"T
y"T"
Ttype:

2
Á
StatefulPartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring ¨
@
StaticRegexFullMatch	
input

output
"
patternstring
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 

VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 "serve*2.8.02v2.8.0-rc1-32-g3f878cff5b68µû

conv2d_24/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:*!
shared_nameconv2d_24/kernel
}
$conv2d_24/kernel/Read/ReadVariableOpReadVariableOpconv2d_24/kernel*&
_output_shapes
:*
dtype0
t
conv2d_24/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_nameconv2d_24/bias
m
"conv2d_24/bias/Read/ReadVariableOpReadVariableOpconv2d_24/bias*
_output_shapes
:*
dtype0

conv2d_25/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape: *!
shared_nameconv2d_25/kernel
}
$conv2d_25/kernel/Read/ReadVariableOpReadVariableOpconv2d_25/kernel*&
_output_shapes
: *
dtype0
t
conv2d_25/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameconv2d_25/bias
m
"conv2d_25/bias/Read/ReadVariableOpReadVariableOpconv2d_25/bias*
_output_shapes
: *
dtype0

conv2d_26/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape: @*!
shared_nameconv2d_26/kernel
}
$conv2d_26/kernel/Read/ReadVariableOpReadVariableOpconv2d_26/kernel*&
_output_shapes
: @*
dtype0
t
conv2d_26/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*
shared_nameconv2d_26/bias
m
"conv2d_26/bias/Read/ReadVariableOpReadVariableOpconv2d_26/bias*
_output_shapes
:@*
dtype0
}
dense_16/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:* 
shared_namedense_16/kernel
v
#dense_16/kernel/Read/ReadVariableOpReadVariableOpdense_16/kernel*!
_output_shapes
:*
dtype0
s
dense_16/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_namedense_16/bias
l
!dense_16/bias/Read/ReadVariableOpReadVariableOpdense_16/bias*
_output_shapes	
:*
dtype0
{
dense_17/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	* 
shared_namedense_17/kernel
t
#dense_17/kernel/Read/ReadVariableOpReadVariableOpdense_17/kernel*
_output_shapes
:	*
dtype0
r
dense_17/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_namedense_17/bias
k
!dense_17/bias/Read/ReadVariableOpReadVariableOpdense_17/bias*
_output_shapes
:*
dtype0
f
	Adam/iterVarHandleOp*
_output_shapes
: *
dtype0	*
shape: *
shared_name	Adam/iter
_
Adam/iter/Read/ReadVariableOpReadVariableOp	Adam/iter*
_output_shapes
: *
dtype0	
j
Adam/beta_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_1
c
Adam/beta_1/Read/ReadVariableOpReadVariableOpAdam/beta_1*
_output_shapes
: *
dtype0
j
Adam/beta_2VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_2
c
Adam/beta_2/Read/ReadVariableOpReadVariableOpAdam/beta_2*
_output_shapes
: *
dtype0
h

Adam/decayVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name
Adam/decay
a
Adam/decay/Read/ReadVariableOpReadVariableOp
Adam/decay*
_output_shapes
: *
dtype0
x
Adam/learning_rateVarHandleOp*
_output_shapes
: *
dtype0*
shape: *#
shared_nameAdam/learning_rate
q
&Adam/learning_rate/Read/ReadVariableOpReadVariableOpAdam/learning_rate*
_output_shapes
: *
dtype0
^
totalVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nametotal
W
total/Read/ReadVariableOpReadVariableOptotal*
_output_shapes
: *
dtype0
^
countVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_namecount
W
count/Read/ReadVariableOpReadVariableOpcount*
_output_shapes
: *
dtype0
b
total_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	total_1
[
total_1/Read/ReadVariableOpReadVariableOptotal_1*
_output_shapes
: *
dtype0
b
count_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	count_1
[
count_1/Read/ReadVariableOpReadVariableOpcount_1*
_output_shapes
: *
dtype0
º
1sequential_11/sequential_9/random_flip_4/StateVarVarHandleOp*
_output_shapes
: *
dtype0	*
shape:*B
shared_name31sequential_11/sequential_9/random_flip_4/StateVar
³
Esequential_11/sequential_9/random_flip_4/StateVar/Read/ReadVariableOpReadVariableOp1sequential_11/sequential_9/random_flip_4/StateVar*
_output_shapes
:*
dtype0	
Â
5sequential_11/sequential_9/random_rotation_4/StateVarVarHandleOp*
_output_shapes
: *
dtype0	*
shape:*F
shared_name75sequential_11/sequential_9/random_rotation_4/StateVar
»
Isequential_11/sequential_9/random_rotation_4/StateVar/Read/ReadVariableOpReadVariableOp5sequential_11/sequential_9/random_rotation_4/StateVar*
_output_shapes
:*
dtype0	
º
1sequential_11/sequential_9/random_zoom_4/StateVarVarHandleOp*
_output_shapes
: *
dtype0	*
shape:*B
shared_name31sequential_11/sequential_9/random_zoom_4/StateVar
³
Esequential_11/sequential_9/random_zoom_4/StateVar/Read/ReadVariableOpReadVariableOp1sequential_11/sequential_9/random_zoom_4/StateVar*
_output_shapes
:*
dtype0	

Adam/conv2d_24/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*(
shared_nameAdam/conv2d_24/kernel/m

+Adam/conv2d_24/kernel/m/Read/ReadVariableOpReadVariableOpAdam/conv2d_24/kernel/m*&
_output_shapes
:*
dtype0

Adam/conv2d_24/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*&
shared_nameAdam/conv2d_24/bias/m
{
)Adam/conv2d_24/bias/m/Read/ReadVariableOpReadVariableOpAdam/conv2d_24/bias/m*
_output_shapes
:*
dtype0

Adam/conv2d_25/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape: *(
shared_nameAdam/conv2d_25/kernel/m

+Adam/conv2d_25/kernel/m/Read/ReadVariableOpReadVariableOpAdam/conv2d_25/kernel/m*&
_output_shapes
: *
dtype0

Adam/conv2d_25/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape: *&
shared_nameAdam/conv2d_25/bias/m
{
)Adam/conv2d_25/bias/m/Read/ReadVariableOpReadVariableOpAdam/conv2d_25/bias/m*
_output_shapes
: *
dtype0

Adam/conv2d_26/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape: @*(
shared_nameAdam/conv2d_26/kernel/m

+Adam/conv2d_26/kernel/m/Read/ReadVariableOpReadVariableOpAdam/conv2d_26/kernel/m*&
_output_shapes
: @*
dtype0

Adam/conv2d_26/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*&
shared_nameAdam/conv2d_26/bias/m
{
)Adam/conv2d_26/bias/m/Read/ReadVariableOpReadVariableOpAdam/conv2d_26/bias/m*
_output_shapes
:@*
dtype0

Adam/dense_16/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*'
shared_nameAdam/dense_16/kernel/m

*Adam/dense_16/kernel/m/Read/ReadVariableOpReadVariableOpAdam/dense_16/kernel/m*!
_output_shapes
:*
dtype0

Adam/dense_16/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*%
shared_nameAdam/dense_16/bias/m
z
(Adam/dense_16/bias/m/Read/ReadVariableOpReadVariableOpAdam/dense_16/bias/m*
_output_shapes	
:*
dtype0

Adam/dense_17/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	*'
shared_nameAdam/dense_17/kernel/m

*Adam/dense_17/kernel/m/Read/ReadVariableOpReadVariableOpAdam/dense_17/kernel/m*
_output_shapes
:	*
dtype0

Adam/dense_17/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*%
shared_nameAdam/dense_17/bias/m
y
(Adam/dense_17/bias/m/Read/ReadVariableOpReadVariableOpAdam/dense_17/bias/m*
_output_shapes
:*
dtype0

Adam/conv2d_24/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*(
shared_nameAdam/conv2d_24/kernel/v

+Adam/conv2d_24/kernel/v/Read/ReadVariableOpReadVariableOpAdam/conv2d_24/kernel/v*&
_output_shapes
:*
dtype0

Adam/conv2d_24/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*&
shared_nameAdam/conv2d_24/bias/v
{
)Adam/conv2d_24/bias/v/Read/ReadVariableOpReadVariableOpAdam/conv2d_24/bias/v*
_output_shapes
:*
dtype0

Adam/conv2d_25/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape: *(
shared_nameAdam/conv2d_25/kernel/v

+Adam/conv2d_25/kernel/v/Read/ReadVariableOpReadVariableOpAdam/conv2d_25/kernel/v*&
_output_shapes
: *
dtype0

Adam/conv2d_25/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape: *&
shared_nameAdam/conv2d_25/bias/v
{
)Adam/conv2d_25/bias/v/Read/ReadVariableOpReadVariableOpAdam/conv2d_25/bias/v*
_output_shapes
: *
dtype0

Adam/conv2d_26/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape: @*(
shared_nameAdam/conv2d_26/kernel/v

+Adam/conv2d_26/kernel/v/Read/ReadVariableOpReadVariableOpAdam/conv2d_26/kernel/v*&
_output_shapes
: @*
dtype0

Adam/conv2d_26/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*&
shared_nameAdam/conv2d_26/bias/v
{
)Adam/conv2d_26/bias/v/Read/ReadVariableOpReadVariableOpAdam/conv2d_26/bias/v*
_output_shapes
:@*
dtype0

Adam/dense_16/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*'
shared_nameAdam/dense_16/kernel/v

*Adam/dense_16/kernel/v/Read/ReadVariableOpReadVariableOpAdam/dense_16/kernel/v*!
_output_shapes
:*
dtype0

Adam/dense_16/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*%
shared_nameAdam/dense_16/bias/v
z
(Adam/dense_16/bias/v/Read/ReadVariableOpReadVariableOpAdam/dense_16/bias/v*
_output_shapes	
:*
dtype0

Adam/dense_17/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	*'
shared_nameAdam/dense_17/kernel/v

*Adam/dense_17/kernel/v/Read/ReadVariableOpReadVariableOpAdam/dense_17/kernel/v*
_output_shapes
:	*
dtype0

Adam/dense_17/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*%
shared_nameAdam/dense_17/bias/v
y
(Adam/dense_17/bias/v/Read/ReadVariableOpReadVariableOpAdam/dense_17/bias/v*
_output_shapes
:*
dtype0

NoOpNoOp
Én
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*n
valueúmB÷m Bðm
ì
layer-0
layer-1
layer_with_weights-0
layer-2
layer-3
layer_with_weights-1
layer-4
layer-5
layer_with_weights-2
layer-6
layer-7
	layer-8

layer-9
layer_with_weights-3
layer-10
layer_with_weights-4
layer-11
	optimizer
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
_default_save_signature

signatures*
·
layer-0
layer-1
layer-2
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses*

	variables
 trainable_variables
!regularization_losses
"	keras_api
#__call__
*$&call_and_return_all_conditional_losses* 
¦

%kernel
&bias
'	variables
(trainable_variables
)regularization_losses
*	keras_api
+__call__
*,&call_and_return_all_conditional_losses*

-	variables
.trainable_variables
/regularization_losses
0	keras_api
1__call__
*2&call_and_return_all_conditional_losses* 
¦

3kernel
4bias
5	variables
6trainable_variables
7regularization_losses
8	keras_api
9__call__
*:&call_and_return_all_conditional_losses*

;	variables
<trainable_variables
=regularization_losses
>	keras_api
?__call__
*@&call_and_return_all_conditional_losses* 
¦

Akernel
Bbias
C	variables
Dtrainable_variables
Eregularization_losses
F	keras_api
G__call__
*H&call_and_return_all_conditional_losses*

I	variables
Jtrainable_variables
Kregularization_losses
L	keras_api
M__call__
*N&call_and_return_all_conditional_losses* 
¥
O	variables
Ptrainable_variables
Qregularization_losses
R	keras_api
S_random_generator
T__call__
*U&call_and_return_all_conditional_losses* 

V	variables
Wtrainable_variables
Xregularization_losses
Y	keras_api
Z__call__
*[&call_and_return_all_conditional_losses* 
¦

\kernel
]bias
^	variables
_trainable_variables
`regularization_losses
a	keras_api
b__call__
*c&call_and_return_all_conditional_losses*
¦

dkernel
ebias
f	variables
gtrainable_variables
hregularization_losses
i	keras_api
j__call__
*k&call_and_return_all_conditional_losses*

liter

mbeta_1

nbeta_2
	odecay
plearning_rate%mè&mé3mê4mëAmìBmí\mî]mïdmðemñ%vò&vó3vô4võAvöBv÷\vø]vùdvúevû*
J
%0
&1
32
43
A4
B5
\6
]7
d8
e9*
J
%0
&1
32
43
A4
B5
\6
]7
d8
e9*
* 
°
qnon_trainable_variables

rlayers
smetrics
tlayer_regularization_losses
ulayer_metrics
	variables
trainable_variables
regularization_losses
__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*
* 
* 
* 

vserving_default* 
§
w	variables
xtrainable_variables
yregularization_losses
z	keras_api
{_random_generator
|__call__
*}&call_and_return_all_conditional_losses*
¬
~	variables
trainable_variables
regularization_losses
	keras_api
_random_generator
__call__
+&call_and_return_all_conditional_losses*
®
	variables
trainable_variables
regularization_losses
	keras_api
_random_generator
__call__
+&call_and_return_all_conditional_losses*
* 
* 
* 

non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*
* 
* 
* 
* 
* 

non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
	variables
 trainable_variables
!regularization_losses
#__call__
*$&call_and_return_all_conditional_losses
&$"call_and_return_conditional_losses* 
* 
* 
`Z
VARIABLE_VALUEconv2d_24/kernel6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUE*
\V
VARIABLE_VALUEconv2d_24/bias4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUE*

%0
&1*

%0
&1*
* 

non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
'	variables
(trainable_variables
)regularization_losses
+__call__
*,&call_and_return_all_conditional_losses
&,"call_and_return_conditional_losses*
* 
* 
* 
* 
* 

non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
-	variables
.trainable_variables
/regularization_losses
1__call__
*2&call_and_return_all_conditional_losses
&2"call_and_return_conditional_losses* 
* 
* 
`Z
VARIABLE_VALUEconv2d_25/kernel6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUE*
\V
VARIABLE_VALUEconv2d_25/bias4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUE*

30
41*

30
41*
* 

 non_trainable_variables
¡layers
¢metrics
 £layer_regularization_losses
¤layer_metrics
5	variables
6trainable_variables
7regularization_losses
9__call__
*:&call_and_return_all_conditional_losses
&:"call_and_return_conditional_losses*
* 
* 
* 
* 
* 

¥non_trainable_variables
¦layers
§metrics
 ¨layer_regularization_losses
©layer_metrics
;	variables
<trainable_variables
=regularization_losses
?__call__
*@&call_and_return_all_conditional_losses
&@"call_and_return_conditional_losses* 
* 
* 
`Z
VARIABLE_VALUEconv2d_26/kernel6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUE*
\V
VARIABLE_VALUEconv2d_26/bias4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUE*

A0
B1*

A0
B1*
* 

ªnon_trainable_variables
«layers
¬metrics
 ­layer_regularization_losses
®layer_metrics
C	variables
Dtrainable_variables
Eregularization_losses
G__call__
*H&call_and_return_all_conditional_losses
&H"call_and_return_conditional_losses*
* 
* 
* 
* 
* 

¯non_trainable_variables
°layers
±metrics
 ²layer_regularization_losses
³layer_metrics
I	variables
Jtrainable_variables
Kregularization_losses
M__call__
*N&call_and_return_all_conditional_losses
&N"call_and_return_conditional_losses* 
* 
* 
* 
* 
* 

´non_trainable_variables
µlayers
¶metrics
 ·layer_regularization_losses
¸layer_metrics
O	variables
Ptrainable_variables
Qregularization_losses
T__call__
*U&call_and_return_all_conditional_losses
&U"call_and_return_conditional_losses* 
* 
* 
* 
* 
* 
* 

¹non_trainable_variables
ºlayers
»metrics
 ¼layer_regularization_losses
½layer_metrics
V	variables
Wtrainable_variables
Xregularization_losses
Z__call__
*[&call_and_return_all_conditional_losses
&["call_and_return_conditional_losses* 
* 
* 
_Y
VARIABLE_VALUEdense_16/kernel6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUE*
[U
VARIABLE_VALUEdense_16/bias4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUE*

\0
]1*

\0
]1*
* 

¾non_trainable_variables
¿layers
Àmetrics
 Álayer_regularization_losses
Âlayer_metrics
^	variables
_trainable_variables
`regularization_losses
b__call__
*c&call_and_return_all_conditional_losses
&c"call_and_return_conditional_losses*
* 
* 
_Y
VARIABLE_VALUEdense_17/kernel6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUE*
[U
VARIABLE_VALUEdense_17/bias4layer_with_weights-4/bias/.ATTRIBUTES/VARIABLE_VALUE*

d0
e1*

d0
e1*
* 

Ãnon_trainable_variables
Älayers
Åmetrics
 Ælayer_regularization_losses
Çlayer_metrics
f	variables
gtrainable_variables
hregularization_losses
j__call__
*k&call_and_return_all_conditional_losses
&k"call_and_return_conditional_losses*
* 
* 
LF
VARIABLE_VALUE	Adam/iter)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUE*
PJ
VARIABLE_VALUEAdam/beta_1+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUE*
PJ
VARIABLE_VALUEAdam/beta_2+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUE*
NH
VARIABLE_VALUE
Adam/decay*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUE*
^X
VARIABLE_VALUEAdam/learning_rate2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUE*
* 
Z
0
1
2
3
4
5
6
7
	8

9
10
11*

È0
É1*
* 
* 
* 
* 
* 
* 

Ênon_trainable_variables
Ëlayers
Ìmetrics
 Ílayer_regularization_losses
Îlayer_metrics
w	variables
xtrainable_variables
yregularization_losses
|__call__
*}&call_and_return_all_conditional_losses
&}"call_and_return_conditional_losses* 

Ï
_generator*
* 
* 
* 
* 
* 

Ðnon_trainable_variables
Ñlayers
Òmetrics
 Ólayer_regularization_losses
Ôlayer_metrics
~	variables
trainable_variables
regularization_losses
__call__
+&call_and_return_all_conditional_losses
'"call_and_return_conditional_losses* 

Õ
_generator*
* 
* 
* 
* 
* 

Önon_trainable_variables
×layers
Ømetrics
 Ùlayer_regularization_losses
Úlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
+&call_and_return_all_conditional_losses
'"call_and_return_conditional_losses* 

Û
_generator*
* 
* 
* 

0
1
2*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
<

Ütotal

Ýcount
Þ	variables
ß	keras_api*
M

àtotal

ácount
â
_fn_kwargs
ã	variables
ä	keras_api*
* 
* 
* 
* 
* 

å
_state_var*
* 
* 
* 
* 
* 

æ
_state_var*
* 
* 
* 
* 
* 

ç
_state_var*
SM
VARIABLE_VALUEtotal4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUE*
SM
VARIABLE_VALUEcount4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUE*

Ü0
Ý1*

Þ	variables*
UO
VARIABLE_VALUEtotal_14keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUE*
UO
VARIABLE_VALUEcount_14keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUE*
* 

à0
á1*

ã	variables*

VARIABLE_VALUE1sequential_11/sequential_9/random_flip_4/StateVarRlayer-0/layer-0/_random_generator/_generator/_state_var/.ATTRIBUTES/VARIABLE_VALUE*
¢
VARIABLE_VALUE5sequential_11/sequential_9/random_rotation_4/StateVarRlayer-0/layer-1/_random_generator/_generator/_state_var/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE1sequential_11/sequential_9/random_zoom_4/StateVarRlayer-0/layer-2/_random_generator/_generator/_state_var/.ATTRIBUTES/VARIABLE_VALUE*
}
VARIABLE_VALUEAdam/conv2d_24/kernel/mRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
y
VARIABLE_VALUEAdam/conv2d_24/bias/mPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
}
VARIABLE_VALUEAdam/conv2d_25/kernel/mRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
y
VARIABLE_VALUEAdam/conv2d_25/bias/mPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
}
VARIABLE_VALUEAdam/conv2d_26/kernel/mRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
y
VARIABLE_VALUEAdam/conv2d_26/bias/mPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
|
VARIABLE_VALUEAdam/dense_16/kernel/mRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
~x
VARIABLE_VALUEAdam/dense_16/bias/mPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
|
VARIABLE_VALUEAdam/dense_17/kernel/mRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
~x
VARIABLE_VALUEAdam/dense_17/bias/mPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
}
VARIABLE_VALUEAdam/conv2d_24/kernel/vRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
y
VARIABLE_VALUEAdam/conv2d_24/bias/vPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
}
VARIABLE_VALUEAdam/conv2d_25/kernel/vRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
y
VARIABLE_VALUEAdam/conv2d_25/bias/vPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
}
VARIABLE_VALUEAdam/conv2d_26/kernel/vRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
y
VARIABLE_VALUEAdam/conv2d_26/bias/vPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
|
VARIABLE_VALUEAdam/dense_16/kernel/vRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
~x
VARIABLE_VALUEAdam/dense_16/bias/vPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
|
VARIABLE_VALUEAdam/dense_17/kernel/vRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
~x
VARIABLE_VALUEAdam/dense_17/bias/vPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

"serving_default_sequential_9_inputPlaceholder*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà*
dtype0*&
shape:ÿÿÿÿÿÿÿÿÿàà
ö
StatefulPartitionedCallStatefulPartitionedCall"serving_default_sequential_9_inputconv2d_24/kernelconv2d_24/biasconv2d_25/kernelconv2d_25/biasconv2d_26/kernelconv2d_26/biasdense_16/kerneldense_16/biasdense_17/kerneldense_17/bias*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*,
_read_only_resource_inputs

	
*-
config_proto

CPU

GPU 2J 8 *,
f'R%
#__inference_signature_wrapper_48195
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 

StatefulPartitionedCall_1StatefulPartitionedCallsaver_filename$conv2d_24/kernel/Read/ReadVariableOp"conv2d_24/bias/Read/ReadVariableOp$conv2d_25/kernel/Read/ReadVariableOp"conv2d_25/bias/Read/ReadVariableOp$conv2d_26/kernel/Read/ReadVariableOp"conv2d_26/bias/Read/ReadVariableOp#dense_16/kernel/Read/ReadVariableOp!dense_16/bias/Read/ReadVariableOp#dense_17/kernel/Read/ReadVariableOp!dense_17/bias/Read/ReadVariableOpAdam/iter/Read/ReadVariableOpAdam/beta_1/Read/ReadVariableOpAdam/beta_2/Read/ReadVariableOpAdam/decay/Read/ReadVariableOp&Adam/learning_rate/Read/ReadVariableOptotal/Read/ReadVariableOpcount/Read/ReadVariableOptotal_1/Read/ReadVariableOpcount_1/Read/ReadVariableOpEsequential_11/sequential_9/random_flip_4/StateVar/Read/ReadVariableOpIsequential_11/sequential_9/random_rotation_4/StateVar/Read/ReadVariableOpEsequential_11/sequential_9/random_zoom_4/StateVar/Read/ReadVariableOp+Adam/conv2d_24/kernel/m/Read/ReadVariableOp)Adam/conv2d_24/bias/m/Read/ReadVariableOp+Adam/conv2d_25/kernel/m/Read/ReadVariableOp)Adam/conv2d_25/bias/m/Read/ReadVariableOp+Adam/conv2d_26/kernel/m/Read/ReadVariableOp)Adam/conv2d_26/bias/m/Read/ReadVariableOp*Adam/dense_16/kernel/m/Read/ReadVariableOp(Adam/dense_16/bias/m/Read/ReadVariableOp*Adam/dense_17/kernel/m/Read/ReadVariableOp(Adam/dense_17/bias/m/Read/ReadVariableOp+Adam/conv2d_24/kernel/v/Read/ReadVariableOp)Adam/conv2d_24/bias/v/Read/ReadVariableOp+Adam/conv2d_25/kernel/v/Read/ReadVariableOp)Adam/conv2d_25/bias/v/Read/ReadVariableOp+Adam/conv2d_26/kernel/v/Read/ReadVariableOp)Adam/conv2d_26/bias/v/Read/ReadVariableOp*Adam/dense_16/kernel/v/Read/ReadVariableOp(Adam/dense_16/bias/v/Read/ReadVariableOp*Adam/dense_17/kernel/v/Read/ReadVariableOp(Adam/dense_17/bias/v/Read/ReadVariableOpConst*7
Tin0
.2,				*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *'
f"R 
__inference__traced_save_49156
¿	
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenameconv2d_24/kernelconv2d_24/biasconv2d_25/kernelconv2d_25/biasconv2d_26/kernelconv2d_26/biasdense_16/kerneldense_16/biasdense_17/kerneldense_17/bias	Adam/iterAdam/beta_1Adam/beta_2
Adam/decayAdam/learning_ratetotalcounttotal_1count_11sequential_11/sequential_9/random_flip_4/StateVar5sequential_11/sequential_9/random_rotation_4/StateVar1sequential_11/sequential_9/random_zoom_4/StateVarAdam/conv2d_24/kernel/mAdam/conv2d_24/bias/mAdam/conv2d_25/kernel/mAdam/conv2d_25/bias/mAdam/conv2d_26/kernel/mAdam/conv2d_26/bias/mAdam/dense_16/kernel/mAdam/dense_16/bias/mAdam/dense_17/kernel/mAdam/dense_17/bias/mAdam/conv2d_24/kernel/vAdam/conv2d_24/bias/vAdam/conv2d_25/kernel/vAdam/conv2d_25/bias/vAdam/conv2d_26/kernel/vAdam/conv2d_26/bias/vAdam/dense_16/kernel/vAdam/dense_16/bias/vAdam/dense_17/kernel/vAdam/dense_17/bias/v*6
Tin/
-2+*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 **
f%R#
!__inference__traced_restore_49292

ý
D__inference_conv2d_25_layer_call_and_return_conditional_losses_47345

inputs8
conv2d_readvariableop_resource: -
biasadd_readvariableop_resource: 
identity¢BiasAdd/ReadVariableOp¢Conv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
: *
dtype0
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿpp *
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿpp X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿpp i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿpp w
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:ÿÿÿÿÿÿÿÿÿpp: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿpp
 
_user_specified_nameinputs
ê

)__inference_conv2d_25_layer_call_fn_48537

inputs!
unknown: 
	unknown_0: 
identity¢StatefulPartitionedCallá
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿpp *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_conv2d_25_layer_call_and_return_conditional_losses_47345w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿpp `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:ÿÿÿÿÿÿÿÿÿpp: : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿpp
 
_user_specified_nameinputs
ê

)__inference_conv2d_26_layer_call_fn_48567

inputs!
unknown: @
	unknown_0:@
identity¢StatefulPartitionedCallá
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ88@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_conv2d_26_layer_call_and_return_conditional_losses_47363w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ88@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:ÿÿÿÿÿÿÿÿÿ88 : : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ88 
 
_user_specified_nameinputs

g
K__inference_max_pooling2d_26_layer_call_and_return_conditional_losses_48588

inputs
identity¢
MaxPoolMaxPoolinputs*J
_output_shapes8
6:4ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*
ksize
*
paddingVALID*
strides
{
IdentityIdentityMaxPool:output:0*
T0*J
_output_shapes8
6:4ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:r n
J
_output_shapes8
6:4ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
àX

__inference__traced_save_49156
file_prefix/
+savev2_conv2d_24_kernel_read_readvariableop-
)savev2_conv2d_24_bias_read_readvariableop/
+savev2_conv2d_25_kernel_read_readvariableop-
)savev2_conv2d_25_bias_read_readvariableop/
+savev2_conv2d_26_kernel_read_readvariableop-
)savev2_conv2d_26_bias_read_readvariableop.
*savev2_dense_16_kernel_read_readvariableop,
(savev2_dense_16_bias_read_readvariableop.
*savev2_dense_17_kernel_read_readvariableop,
(savev2_dense_17_bias_read_readvariableop(
$savev2_adam_iter_read_readvariableop	*
&savev2_adam_beta_1_read_readvariableop*
&savev2_adam_beta_2_read_readvariableop)
%savev2_adam_decay_read_readvariableop1
-savev2_adam_learning_rate_read_readvariableop$
 savev2_total_read_readvariableop$
 savev2_count_read_readvariableop&
"savev2_total_1_read_readvariableop&
"savev2_count_1_read_readvariableopP
Lsavev2_sequential_11_sequential_9_random_flip_4_statevar_read_readvariableop	T
Psavev2_sequential_11_sequential_9_random_rotation_4_statevar_read_readvariableop	P
Lsavev2_sequential_11_sequential_9_random_zoom_4_statevar_read_readvariableop	6
2savev2_adam_conv2d_24_kernel_m_read_readvariableop4
0savev2_adam_conv2d_24_bias_m_read_readvariableop6
2savev2_adam_conv2d_25_kernel_m_read_readvariableop4
0savev2_adam_conv2d_25_bias_m_read_readvariableop6
2savev2_adam_conv2d_26_kernel_m_read_readvariableop4
0savev2_adam_conv2d_26_bias_m_read_readvariableop5
1savev2_adam_dense_16_kernel_m_read_readvariableop3
/savev2_adam_dense_16_bias_m_read_readvariableop5
1savev2_adam_dense_17_kernel_m_read_readvariableop3
/savev2_adam_dense_17_bias_m_read_readvariableop6
2savev2_adam_conv2d_24_kernel_v_read_readvariableop4
0savev2_adam_conv2d_24_bias_v_read_readvariableop6
2savev2_adam_conv2d_25_kernel_v_read_readvariableop4
0savev2_adam_conv2d_25_bias_v_read_readvariableop6
2savev2_adam_conv2d_26_kernel_v_read_readvariableop4
0savev2_adam_conv2d_26_bias_v_read_readvariableop5
1savev2_adam_dense_16_kernel_v_read_readvariableop3
/savev2_adam_dense_16_bias_v_read_readvariableop5
1savev2_adam_dense_17_kernel_v_read_readvariableop3
/savev2_adam_dense_17_bias_v_read_readvariableop
savev2_const

identity_1¢MergeV2Checkpointsw
StaticRegexFullMatchStaticRegexFullMatchfile_prefix"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*Z
ConstConst"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.parta
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/part
SelectSelectStaticRegexFullMatch:output:0Const:output:0Const_1:output:0"/device:CPU:**
T0*
_output_shapes
: f

StringJoin
StringJoinfile_prefixSelect:output:0"/device:CPU:**
N*
_output_shapes
: L

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :f
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : 
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: å
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:+*
dtype0*
valueB+B6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-4/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEBRlayer-0/layer-0/_random_generator/_generator/_state_var/.ATTRIBUTES/VARIABLE_VALUEBRlayer-0/layer-1/_random_generator/_generator/_state_var/.ATTRIBUTES/VARIABLE_VALUEBRlayer-0/layer-2/_random_generator/_generator/_state_var/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPHÃ
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:+*
dtype0*i
value`B^+B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B È
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0+savev2_conv2d_24_kernel_read_readvariableop)savev2_conv2d_24_bias_read_readvariableop+savev2_conv2d_25_kernel_read_readvariableop)savev2_conv2d_25_bias_read_readvariableop+savev2_conv2d_26_kernel_read_readvariableop)savev2_conv2d_26_bias_read_readvariableop*savev2_dense_16_kernel_read_readvariableop(savev2_dense_16_bias_read_readvariableop*savev2_dense_17_kernel_read_readvariableop(savev2_dense_17_bias_read_readvariableop$savev2_adam_iter_read_readvariableop&savev2_adam_beta_1_read_readvariableop&savev2_adam_beta_2_read_readvariableop%savev2_adam_decay_read_readvariableop-savev2_adam_learning_rate_read_readvariableop savev2_total_read_readvariableop savev2_count_read_readvariableop"savev2_total_1_read_readvariableop"savev2_count_1_read_readvariableopLsavev2_sequential_11_sequential_9_random_flip_4_statevar_read_readvariableopPsavev2_sequential_11_sequential_9_random_rotation_4_statevar_read_readvariableopLsavev2_sequential_11_sequential_9_random_zoom_4_statevar_read_readvariableop2savev2_adam_conv2d_24_kernel_m_read_readvariableop0savev2_adam_conv2d_24_bias_m_read_readvariableop2savev2_adam_conv2d_25_kernel_m_read_readvariableop0savev2_adam_conv2d_25_bias_m_read_readvariableop2savev2_adam_conv2d_26_kernel_m_read_readvariableop0savev2_adam_conv2d_26_bias_m_read_readvariableop1savev2_adam_dense_16_kernel_m_read_readvariableop/savev2_adam_dense_16_bias_m_read_readvariableop1savev2_adam_dense_17_kernel_m_read_readvariableop/savev2_adam_dense_17_bias_m_read_readvariableop2savev2_adam_conv2d_24_kernel_v_read_readvariableop0savev2_adam_conv2d_24_bias_v_read_readvariableop2savev2_adam_conv2d_25_kernel_v_read_readvariableop0savev2_adam_conv2d_25_bias_v_read_readvariableop2savev2_adam_conv2d_26_kernel_v_read_readvariableop0savev2_adam_conv2d_26_bias_v_read_readvariableop1savev2_adam_dense_16_kernel_v_read_readvariableop/savev2_adam_dense_16_bias_v_read_readvariableop1savev2_adam_dense_17_kernel_v_read_readvariableop/savev2_adam_dense_17_bias_v_read_readvariableopsavev2_const"/device:CPU:0*
_output_shapes
 *9
dtypes/
-2+				
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*
_output_shapes
 f
IdentityIdentityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: Q

Identity_1IdentityIdentity:output:0^NoOp*
T0*
_output_shapes
: [
NoOpNoOp^MergeV2Checkpoints*"
_acd_function_control_output(*
_output_shapes
 "!

identity_1Identity_1:output:0*
_input_shapesò
ï: ::: : : @:@:::	:: : : : : : : : : :::::: : : @:@:::	:::: : : @:@:::	:: 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:,(
&
_output_shapes
:: 

_output_shapes
::,(
&
_output_shapes
: : 

_output_shapes
: :,(
&
_output_shapes
: @: 

_output_shapes
:@:'#
!
_output_shapes
::!

_output_shapes	
::%	!

_output_shapes
:	: 


_output_shapes
::

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: : 

_output_shapes
:: 

_output_shapes
:: 

_output_shapes
::,(
&
_output_shapes
:: 

_output_shapes
::,(
&
_output_shapes
: : 

_output_shapes
: :,(
&
_output_shapes
: @: 

_output_shapes
:@:'#
!
_output_shapes
::!

_output_shapes	
::%!

_output_shapes
:	:  

_output_shapes
::,!(
&
_output_shapes
:: "

_output_shapes
::,#(
&
_output_shapes
: : $

_output_shapes
: :,%(
&
_output_shapes
: @: &

_output_shapes
:@:''#
!
_output_shapes
::!(

_output_shapes	
::%)!

_output_shapes
:	: *

_output_shapes
::+

_output_shapes
: 

h
L__inference_random_rotation_4_layer_call_and_return_conditional_losses_48756

inputs
identityX
IdentityIdentityinputs*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿàà:Y U
1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
 
_user_specified_nameinputs

g
K__inference_max_pooling2d_24_layer_call_and_return_conditional_losses_47271

inputs
identity¢
MaxPoolMaxPoolinputs*J
_output_shapes8
6:4ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*
ksize
*
paddingVALID*
strides
{
IdentityIdentityMaxPool:output:0*
T0*J
_output_shapes8
6:4ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:r n
J
_output_shapes8
6:4ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs

g
K__inference_max_pooling2d_25_layer_call_and_return_conditional_losses_47283

inputs
identity¢
MaxPoolMaxPoolinputs*J
_output_shapes8
6:4ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*
ksize
*
paddingVALID*
strides
{
IdentityIdentityMaxPool:output:0*
T0*J
_output_shapes8
6:4ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:r n
J
_output_shapes8
6:4ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
0
ü
H__inference_sequential_13_layer_call_and_return_conditional_losses_47420

inputs)
conv2d_24_47328:
conv2d_24_47330:)
conv2d_25_47346: 
conv2d_25_47348: )
conv2d_26_47364: @
conv2d_26_47366:@#
dense_16_47397:
dense_16_47399:	!
dense_17_47414:	
dense_17_47416:
identity¢!conv2d_24/StatefulPartitionedCall¢!conv2d_25/StatefulPartitionedCall¢!conv2d_26/StatefulPartitionedCall¢ dense_16/StatefulPartitionedCall¢ dense_17/StatefulPartitionedCallÉ
sequential_9/PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_sequential_9_layer_call_and_return_conditional_losses_46882æ
rescaling_9/PartitionedCallPartitionedCall%sequential_9/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_rescaling_9_layer_call_and_return_conditional_losses_47314
!conv2d_24/StatefulPartitionedCallStatefulPartitionedCall$rescaling_9/PartitionedCall:output:0conv2d_24_47328conv2d_24_47330*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_conv2d_24_layer_call_and_return_conditional_losses_47327ó
 max_pooling2d_24/PartitionedCallPartitionedCall*conv2d_24/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿpp* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *T
fORM
K__inference_max_pooling2d_24_layer_call_and_return_conditional_losses_47271
!conv2d_25/StatefulPartitionedCallStatefulPartitionedCall)max_pooling2d_24/PartitionedCall:output:0conv2d_25_47346conv2d_25_47348*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿpp *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_conv2d_25_layer_call_and_return_conditional_losses_47345ó
 max_pooling2d_25/PartitionedCallPartitionedCall*conv2d_25/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ88 * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *T
fORM
K__inference_max_pooling2d_25_layer_call_and_return_conditional_losses_47283
!conv2d_26/StatefulPartitionedCallStatefulPartitionedCall)max_pooling2d_25/PartitionedCall:output:0conv2d_26_47364conv2d_26_47366*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ88@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_conv2d_26_layer_call_and_return_conditional_losses_47363ó
 max_pooling2d_26/PartitionedCallPartitionedCall*conv2d_26/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *T
fORM
K__inference_max_pooling2d_26_layer_call_and_return_conditional_losses_47295ä
dropout_8/PartitionedCallPartitionedCall)max_pooling2d_26/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_dropout_8_layer_call_and_return_conditional_losses_47375×
flatten_8/PartitionedCallPartitionedCall"dropout_8/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *)
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_flatten_8_layer_call_and_return_conditional_losses_47383
 dense_16/StatefulPartitionedCallStatefulPartitionedCall"flatten_8/PartitionedCall:output:0dense_16_47397dense_16_47399*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_dense_16_layer_call_and_return_conditional_losses_47396
 dense_17/StatefulPartitionedCallStatefulPartitionedCall)dense_16/StatefulPartitionedCall:output:0dense_17_47414dense_17_47416*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_dense_17_layer_call_and_return_conditional_losses_47413x
IdentityIdentity)dense_17/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿø
NoOpNoOp"^conv2d_24/StatefulPartitionedCall"^conv2d_25/StatefulPartitionedCall"^conv2d_26/StatefulPartitionedCall!^dense_16/StatefulPartitionedCall!^dense_17/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:ÿÿÿÿÿÿÿÿÿàà: : : : : : : : : : 2F
!conv2d_24/StatefulPartitionedCall!conv2d_24/StatefulPartitionedCall2F
!conv2d_25/StatefulPartitionedCall!conv2d_25/StatefulPartitionedCall2F
!conv2d_26/StatefulPartitionedCall!conv2d_26/StatefulPartitionedCall2D
 dense_16/StatefulPartitionedCall dense_16/StatefulPartitionedCall2D
 dense_17/StatefulPartitionedCall dense_17/StatefulPartitionedCall:Y U
1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
 
_user_specified_nameinputs
¸
L
0__inference_max_pooling2d_25_layer_call_fn_48553

inputs
identityÙ
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *J
_output_shapes8
6:4ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *T
fORM
K__inference_max_pooling2d_25_layer_call_and_return_conditional_losses_47283
IdentityIdentityPartitionedCall:output:0*
T0*J
_output_shapes8
6:4ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:r n
J
_output_shapes8
6:4ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
½
E
)__inference_dropout_8_layer_call_fn_48593

inputs
identity·
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_dropout_8_layer_call_and_return_conditional_losses_47375h
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:ÿÿÿÿÿÿÿÿÿ@:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@
 
_user_specified_nameinputs


õ
C__inference_dense_17_layer_call_and_return_conditional_losses_48666

inputs1
matmul_readvariableop_resource:	-
biasadd_readvariableop_resource:
identity¢BiasAdd/ReadVariableOp¢MatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿr
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿV
SigmoidSigmoidBiasAdd:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿZ
IdentityIdentitySigmoid:y:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿw
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
»÷
è
H__inference_sequential_13_layer_call_and_return_conditional_losses_48168

inputsZ
Lsequential_9_random_flip_4_stateful_uniform_full_int_rngreadandskip_resource:	U
Gsequential_9_random_rotation_4_stateful_uniform_rngreadandskip_resource:	Q
Csequential_9_random_zoom_4_stateful_uniform_rngreadandskip_resource:	B
(conv2d_24_conv2d_readvariableop_resource:7
)conv2d_24_biasadd_readvariableop_resource:B
(conv2d_25_conv2d_readvariableop_resource: 7
)conv2d_25_biasadd_readvariableop_resource: B
(conv2d_26_conv2d_readvariableop_resource: @7
)conv2d_26_biasadd_readvariableop_resource:@<
'dense_16_matmul_readvariableop_resource:7
(dense_16_biasadd_readvariableop_resource:	:
'dense_17_matmul_readvariableop_resource:	6
(dense_17_biasadd_readvariableop_resource:
identity¢ conv2d_24/BiasAdd/ReadVariableOp¢conv2d_24/Conv2D/ReadVariableOp¢ conv2d_25/BiasAdd/ReadVariableOp¢conv2d_25/Conv2D/ReadVariableOp¢ conv2d_26/BiasAdd/ReadVariableOp¢conv2d_26/Conv2D/ReadVariableOp¢dense_16/BiasAdd/ReadVariableOp¢dense_16/MatMul/ReadVariableOp¢dense_17/BiasAdd/ReadVariableOp¢dense_17/MatMul/ReadVariableOp¢Csequential_9/random_flip_4/stateful_uniform_full_int/RngReadAndSkip¢>sequential_9/random_rotation_4/stateful_uniform/RngReadAndSkip¢:sequential_9/random_zoom_4/stateful_uniform/RngReadAndSkip
:sequential_9/random_flip_4/stateful_uniform_full_int/shapeConst*
_output_shapes
:*
dtype0*
valueB:
:sequential_9/random_flip_4/stateful_uniform_full_int/ConstConst*
_output_shapes
:*
dtype0*
valueB: ì
9sequential_9/random_flip_4/stateful_uniform_full_int/ProdProdCsequential_9/random_flip_4/stateful_uniform_full_int/shape:output:0Csequential_9/random_flip_4/stateful_uniform_full_int/Const:output:0*
T0*
_output_shapes
: }
;sequential_9/random_flip_4/stateful_uniform_full_int/Cast/xConst*
_output_shapes
: *
dtype0*
value	B :·
;sequential_9/random_flip_4/stateful_uniform_full_int/Cast_1CastBsequential_9/random_flip_4/stateful_uniform_full_int/Prod:output:0*

DstT0*

SrcT0*
_output_shapes
: Æ
Csequential_9/random_flip_4/stateful_uniform_full_int/RngReadAndSkipRngReadAndSkipLsequential_9_random_flip_4_stateful_uniform_full_int_rngreadandskip_resourceDsequential_9/random_flip_4/stateful_uniform_full_int/Cast/x:output:0?sequential_9/random_flip_4/stateful_uniform_full_int/Cast_1:y:0*
_output_shapes
:
Hsequential_9/random_flip_4/stateful_uniform_full_int/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 
Jsequential_9/random_flip_4/stateful_uniform_full_int/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
Jsequential_9/random_flip_4/stateful_uniform_full_int/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:à
Bsequential_9/random_flip_4/stateful_uniform_full_int/strided_sliceStridedSliceKsequential_9/random_flip_4/stateful_uniform_full_int/RngReadAndSkip:value:0Qsequential_9/random_flip_4/stateful_uniform_full_int/strided_slice/stack:output:0Ssequential_9/random_flip_4/stateful_uniform_full_int/strided_slice/stack_1:output:0Ssequential_9/random_flip_4/stateful_uniform_full_int/strided_slice/stack_2:output:0*
Index0*
T0	*
_output_shapes
:*

begin_maskÅ
<sequential_9/random_flip_4/stateful_uniform_full_int/BitcastBitcastKsequential_9/random_flip_4/stateful_uniform_full_int/strided_slice:output:0*
T0	*
_output_shapes
:*

type0
Jsequential_9/random_flip_4/stateful_uniform_full_int/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:
Lsequential_9/random_flip_4/stateful_uniform_full_int/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
Lsequential_9/random_flip_4/stateful_uniform_full_int/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ö
Dsequential_9/random_flip_4/stateful_uniform_full_int/strided_slice_1StridedSliceKsequential_9/random_flip_4/stateful_uniform_full_int/RngReadAndSkip:value:0Ssequential_9/random_flip_4/stateful_uniform_full_int/strided_slice_1/stack:output:0Usequential_9/random_flip_4/stateful_uniform_full_int/strided_slice_1/stack_1:output:0Usequential_9/random_flip_4/stateful_uniform_full_int/strided_slice_1/stack_2:output:0*
Index0*
T0	*
_output_shapes
:É
>sequential_9/random_flip_4/stateful_uniform_full_int/Bitcast_1BitcastMsequential_9/random_flip_4/stateful_uniform_full_int/strided_slice_1:output:0*
T0	*
_output_shapes
:*

type0z
8sequential_9/random_flip_4/stateful_uniform_full_int/algConst*
_output_shapes
: *
dtype0*
value	B :
4sequential_9/random_flip_4/stateful_uniform_full_intStatelessRandomUniformFullIntV2Csequential_9/random_flip_4/stateful_uniform_full_int/shape:output:0Gsequential_9/random_flip_4/stateful_uniform_full_int/Bitcast_1:output:0Esequential_9/random_flip_4/stateful_uniform_full_int/Bitcast:output:0Asequential_9/random_flip_4/stateful_uniform_full_int/alg:output:0*
_output_shapes
:*
dtype0	o
%sequential_9/random_flip_4/zeros_likeConst*
_output_shapes
:*
dtype0	*
valueB	R É
 sequential_9/random_flip_4/stackPack=sequential_9/random_flip_4/stateful_uniform_full_int:output:0.sequential_9/random_flip_4/zeros_like:output:0*
N*
T0	*
_output_shapes

:
.sequential_9/random_flip_4/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB"        
0sequential_9/random_flip_4/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       
0sequential_9/random_flip_4/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      þ
(sequential_9/random_flip_4/strided_sliceStridedSlice)sequential_9/random_flip_4/stack:output:07sequential_9/random_flip_4/strided_slice/stack:output:09sequential_9/random_flip_4/strided_slice/stack_1:output:09sequential_9/random_flip_4/strided_slice/stack_2:output:0*
Index0*
T0	*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask¹
Nsequential_9/random_flip_4/stateless_random_flip_left_right/control_dependencyIdentityinputs*
T0*
_class
loc:@inputs*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿààÈ
Asequential_9/random_flip_4/stateless_random_flip_left_right/ShapeShapeWsequential_9/random_flip_4/stateless_random_flip_left_right/control_dependency:output:0*
T0*
_output_shapes
:
Osequential_9/random_flip_4/stateless_random_flip_left_right/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 
Qsequential_9/random_flip_4/stateless_random_flip_left_right/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
Qsequential_9/random_flip_4/stateless_random_flip_left_right/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ý
Isequential_9/random_flip_4/stateless_random_flip_left_right/strided_sliceStridedSliceJsequential_9/random_flip_4/stateless_random_flip_left_right/Shape:output:0Xsequential_9/random_flip_4/stateless_random_flip_left_right/strided_slice/stack:output:0Zsequential_9/random_flip_4/stateless_random_flip_left_right/strided_slice/stack_1:output:0Zsequential_9/random_flip_4/stateless_random_flip_left_right/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskä
Zsequential_9/random_flip_4/stateless_random_flip_left_right/stateless_random_uniform/shapePackRsequential_9/random_flip_4/stateless_random_flip_left_right/strided_slice:output:0*
N*
T0*
_output_shapes
:
Xsequential_9/random_flip_4/stateless_random_flip_left_right/stateless_random_uniform/minConst*
_output_shapes
: *
dtype0*
valueB
 *    
Xsequential_9/random_flip_4/stateless_random_flip_left_right/stateless_random_uniform/maxConst*
_output_shapes
: *
dtype0*
valueB
 *  ?æ
qsequential_9/random_flip_4/stateless_random_flip_left_right/stateless_random_uniform/StatelessRandomGetKeyCounterStatelessRandomGetKeyCounter1sequential_9/random_flip_4/strided_slice:output:0* 
_output_shapes
::³
qsequential_9/random_flip_4/stateless_random_flip_left_right/stateless_random_uniform/StatelessRandomUniformV2/algConst*
_output_shapes
: *
dtype0*
value	B :
msequential_9/random_flip_4/stateless_random_flip_left_right/stateless_random_uniform/StatelessRandomUniformV2StatelessRandomUniformV2csequential_9/random_flip_4/stateless_random_flip_left_right/stateless_random_uniform/shape:output:0wsequential_9/random_flip_4/stateless_random_flip_left_right/stateless_random_uniform/StatelessRandomGetKeyCounter:key:0{sequential_9/random_flip_4/stateless_random_flip_left_right/stateless_random_uniform/StatelessRandomGetKeyCounter:counter:0zsequential_9/random_flip_4/stateless_random_flip_left_right/stateless_random_uniform/StatelessRandomUniformV2/alg:output:0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿÆ
Xsequential_9/random_flip_4/stateless_random_flip_left_right/stateless_random_uniform/subSubasequential_9/random_flip_4/stateless_random_flip_left_right/stateless_random_uniform/max:output:0asequential_9/random_flip_4/stateless_random_flip_left_right/stateless_random_uniform/min:output:0*
T0*
_output_shapes
: ã
Xsequential_9/random_flip_4/stateless_random_flip_left_right/stateless_random_uniform/mulMulvsequential_9/random_flip_4/stateless_random_flip_left_right/stateless_random_uniform/StatelessRandomUniformV2:output:0\sequential_9/random_flip_4/stateless_random_flip_left_right/stateless_random_uniform/sub:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿÌ
Tsequential_9/random_flip_4/stateless_random_flip_left_right/stateless_random_uniformAddV2\sequential_9/random_flip_4/stateless_random_flip_left_right/stateless_random_uniform/mul:z:0asequential_9/random_flip_4/stateless_random_flip_left_right/stateless_random_uniform/min:output:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
Ksequential_9/random_flip_4/stateless_random_flip_left_right/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :
Ksequential_9/random_flip_4/stateless_random_flip_left_right/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :
Ksequential_9/random_flip_4/stateless_random_flip_left_right/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :Õ
Isequential_9/random_flip_4/stateless_random_flip_left_right/Reshape/shapePackRsequential_9/random_flip_4/stateless_random_flip_left_right/strided_slice:output:0Tsequential_9/random_flip_4/stateless_random_flip_left_right/Reshape/shape/1:output:0Tsequential_9/random_flip_4/stateless_random_flip_left_right/Reshape/shape/2:output:0Tsequential_9/random_flip_4/stateless_random_flip_left_right/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:¶
Csequential_9/random_flip_4/stateless_random_flip_left_right/ReshapeReshapeXsequential_9/random_flip_4/stateless_random_flip_left_right/stateless_random_uniform:z:0Rsequential_9/random_flip_4/stateless_random_flip_left_right/Reshape/shape:output:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿÒ
Asequential_9/random_flip_4/stateless_random_flip_left_right/RoundRoundLsequential_9/random_flip_4/stateless_random_flip_left_right/Reshape:output:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
Jsequential_9/random_flip_4/stateless_random_flip_left_right/ReverseV2/axisConst*
_output_shapes
:*
dtype0*
valueB:¼
Esequential_9/random_flip_4/stateless_random_flip_left_right/ReverseV2	ReverseV2Wsequential_9/random_flip_4/stateless_random_flip_left_right/control_dependency:output:0Ssequential_9/random_flip_4/stateless_random_flip_left_right/ReverseV2/axis:output:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
?sequential_9/random_flip_4/stateless_random_flip_left_right/mulMulEsequential_9/random_flip_4/stateless_random_flip_left_right/Round:y:0Nsequential_9/random_flip_4/stateless_random_flip_left_right/ReverseV2:output:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
Asequential_9/random_flip_4/stateless_random_flip_left_right/sub/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
?sequential_9/random_flip_4/stateless_random_flip_left_right/subSubJsequential_9/random_flip_4/stateless_random_flip_left_right/sub/x:output:0Esequential_9/random_flip_4/stateless_random_flip_left_right/Round:y:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¢
Asequential_9/random_flip_4/stateless_random_flip_left_right/mul_1MulCsequential_9/random_flip_4/stateless_random_flip_left_right/sub:z:0Wsequential_9/random_flip_4/stateless_random_flip_left_right/control_dependency:output:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
?sequential_9/random_flip_4/stateless_random_flip_left_right/addAddV2Csequential_9/random_flip_4/stateless_random_flip_left_right/mul:z:0Esequential_9/random_flip_4/stateless_random_flip_left_right/mul_1:z:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
$sequential_9/random_rotation_4/ShapeShapeCsequential_9/random_flip_4/stateless_random_flip_left_right/add:z:0*
T0*
_output_shapes
:|
2sequential_9/random_rotation_4/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: ~
4sequential_9/random_rotation_4/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:~
4sequential_9/random_rotation_4/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ì
,sequential_9/random_rotation_4/strided_sliceStridedSlice-sequential_9/random_rotation_4/Shape:output:0;sequential_9/random_rotation_4/strided_slice/stack:output:0=sequential_9/random_rotation_4/strided_slice/stack_1:output:0=sequential_9/random_rotation_4/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
4sequential_9/random_rotation_4/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:
ýÿÿÿÿÿÿÿÿ
6sequential_9/random_rotation_4/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
þÿÿÿÿÿÿÿÿ
6sequential_9/random_rotation_4/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ô
.sequential_9/random_rotation_4/strided_slice_1StridedSlice-sequential_9/random_rotation_4/Shape:output:0=sequential_9/random_rotation_4/strided_slice_1/stack:output:0?sequential_9/random_rotation_4/strided_slice_1/stack_1:output:0?sequential_9/random_rotation_4/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
#sequential_9/random_rotation_4/CastCast7sequential_9/random_rotation_4/strided_slice_1:output:0*

DstT0*

SrcT0*
_output_shapes
: 
4sequential_9/random_rotation_4/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:
þÿÿÿÿÿÿÿÿ
6sequential_9/random_rotation_4/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ
6sequential_9/random_rotation_4/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ô
.sequential_9/random_rotation_4/strided_slice_2StridedSlice-sequential_9/random_rotation_4/Shape:output:0=sequential_9/random_rotation_4/strided_slice_2/stack:output:0?sequential_9/random_rotation_4/strided_slice_2/stack_1:output:0?sequential_9/random_rotation_4/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
%sequential_9/random_rotation_4/Cast_1Cast7sequential_9/random_rotation_4/strided_slice_2:output:0*

DstT0*

SrcT0*
_output_shapes
: ¢
5sequential_9/random_rotation_4/stateful_uniform/shapePack5sequential_9/random_rotation_4/strided_slice:output:0*
N*
T0*
_output_shapes
:x
3sequential_9/random_rotation_4/stateful_uniform/minConst*
_output_shapes
: *
dtype0*
valueB
 *|Ù ¿x
3sequential_9/random_rotation_4/stateful_uniform/maxConst*
_output_shapes
: *
dtype0*
valueB
 *|Ù ?
5sequential_9/random_rotation_4/stateful_uniform/ConstConst*
_output_shapes
:*
dtype0*
valueB: Ý
4sequential_9/random_rotation_4/stateful_uniform/ProdProd>sequential_9/random_rotation_4/stateful_uniform/shape:output:0>sequential_9/random_rotation_4/stateful_uniform/Const:output:0*
T0*
_output_shapes
: x
6sequential_9/random_rotation_4/stateful_uniform/Cast/xConst*
_output_shapes
: *
dtype0*
value	B :­
6sequential_9/random_rotation_4/stateful_uniform/Cast_1Cast=sequential_9/random_rotation_4/stateful_uniform/Prod:output:0*

DstT0*

SrcT0*
_output_shapes
: ²
>sequential_9/random_rotation_4/stateful_uniform/RngReadAndSkipRngReadAndSkipGsequential_9_random_rotation_4_stateful_uniform_rngreadandskip_resource?sequential_9/random_rotation_4/stateful_uniform/Cast/x:output:0:sequential_9/random_rotation_4/stateful_uniform/Cast_1:y:0*
_output_shapes
:
Csequential_9/random_rotation_4/stateful_uniform/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 
Esequential_9/random_rotation_4/stateful_uniform/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
Esequential_9/random_rotation_4/stateful_uniform/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ç
=sequential_9/random_rotation_4/stateful_uniform/strided_sliceStridedSliceFsequential_9/random_rotation_4/stateful_uniform/RngReadAndSkip:value:0Lsequential_9/random_rotation_4/stateful_uniform/strided_slice/stack:output:0Nsequential_9/random_rotation_4/stateful_uniform/strided_slice/stack_1:output:0Nsequential_9/random_rotation_4/stateful_uniform/strided_slice/stack_2:output:0*
Index0*
T0	*
_output_shapes
:*

begin_mask»
7sequential_9/random_rotation_4/stateful_uniform/BitcastBitcastFsequential_9/random_rotation_4/stateful_uniform/strided_slice:output:0*
T0	*
_output_shapes
:*

type0
Esequential_9/random_rotation_4/stateful_uniform/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:
Gsequential_9/random_rotation_4/stateful_uniform/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
Gsequential_9/random_rotation_4/stateful_uniform/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:½
?sequential_9/random_rotation_4/stateful_uniform/strided_slice_1StridedSliceFsequential_9/random_rotation_4/stateful_uniform/RngReadAndSkip:value:0Nsequential_9/random_rotation_4/stateful_uniform/strided_slice_1/stack:output:0Psequential_9/random_rotation_4/stateful_uniform/strided_slice_1/stack_1:output:0Psequential_9/random_rotation_4/stateful_uniform/strided_slice_1/stack_2:output:0*
Index0*
T0	*
_output_shapes
:¿
9sequential_9/random_rotation_4/stateful_uniform/Bitcast_1BitcastHsequential_9/random_rotation_4/stateful_uniform/strided_slice_1:output:0*
T0	*
_output_shapes
:*

type0
Lsequential_9/random_rotation_4/stateful_uniform/StatelessRandomUniformV2/algConst*
_output_shapes
: *
dtype0*
value	B :¦
Hsequential_9/random_rotation_4/stateful_uniform/StatelessRandomUniformV2StatelessRandomUniformV2>sequential_9/random_rotation_4/stateful_uniform/shape:output:0Bsequential_9/random_rotation_4/stateful_uniform/Bitcast_1:output:0@sequential_9/random_rotation_4/stateful_uniform/Bitcast:output:0Usequential_9/random_rotation_4/stateful_uniform/StatelessRandomUniformV2/alg:output:0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ×
3sequential_9/random_rotation_4/stateful_uniform/subSub<sequential_9/random_rotation_4/stateful_uniform/max:output:0<sequential_9/random_rotation_4/stateful_uniform/min:output:0*
T0*
_output_shapes
: ô
3sequential_9/random_rotation_4/stateful_uniform/mulMulQsequential_9/random_rotation_4/stateful_uniform/StatelessRandomUniformV2:output:07sequential_9/random_rotation_4/stateful_uniform/sub:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿÝ
/sequential_9/random_rotation_4/stateful_uniformAddV27sequential_9/random_rotation_4/stateful_uniform/mul:z:0<sequential_9/random_rotation_4/stateful_uniform/min:output:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿy
4sequential_9/random_rotation_4/rotation_matrix/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Ä
2sequential_9/random_rotation_4/rotation_matrix/subSub)sequential_9/random_rotation_4/Cast_1:y:0=sequential_9/random_rotation_4/rotation_matrix/sub/y:output:0*
T0*
_output_shapes
: 
2sequential_9/random_rotation_4/rotation_matrix/CosCos3sequential_9/random_rotation_4/stateful_uniform:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ{
6sequential_9/random_rotation_4/rotation_matrix/sub_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?È
4sequential_9/random_rotation_4/rotation_matrix/sub_1Sub)sequential_9/random_rotation_4/Cast_1:y:0?sequential_9/random_rotation_4/rotation_matrix/sub_1/y:output:0*
T0*
_output_shapes
: Ù
2sequential_9/random_rotation_4/rotation_matrix/mulMul6sequential_9/random_rotation_4/rotation_matrix/Cos:y:08sequential_9/random_rotation_4/rotation_matrix/sub_1:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
2sequential_9/random_rotation_4/rotation_matrix/SinSin3sequential_9/random_rotation_4/stateful_uniform:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ{
6sequential_9/random_rotation_4/rotation_matrix/sub_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Æ
4sequential_9/random_rotation_4/rotation_matrix/sub_2Sub'sequential_9/random_rotation_4/Cast:y:0?sequential_9/random_rotation_4/rotation_matrix/sub_2/y:output:0*
T0*
_output_shapes
: Û
4sequential_9/random_rotation_4/rotation_matrix/mul_1Mul6sequential_9/random_rotation_4/rotation_matrix/Sin:y:08sequential_9/random_rotation_4/rotation_matrix/sub_2:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿÛ
4sequential_9/random_rotation_4/rotation_matrix/sub_3Sub6sequential_9/random_rotation_4/rotation_matrix/mul:z:08sequential_9/random_rotation_4/rotation_matrix/mul_1:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿÛ
4sequential_9/random_rotation_4/rotation_matrix/sub_4Sub6sequential_9/random_rotation_4/rotation_matrix/sub:z:08sequential_9/random_rotation_4/rotation_matrix/sub_3:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ}
8sequential_9/random_rotation_4/rotation_matrix/truediv/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @ì
6sequential_9/random_rotation_4/rotation_matrix/truedivRealDiv8sequential_9/random_rotation_4/rotation_matrix/sub_4:z:0Asequential_9/random_rotation_4/rotation_matrix/truediv/y:output:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ{
6sequential_9/random_rotation_4/rotation_matrix/sub_5/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Æ
4sequential_9/random_rotation_4/rotation_matrix/sub_5Sub'sequential_9/random_rotation_4/Cast:y:0?sequential_9/random_rotation_4/rotation_matrix/sub_5/y:output:0*
T0*
_output_shapes
: 
4sequential_9/random_rotation_4/rotation_matrix/Sin_1Sin3sequential_9/random_rotation_4/stateful_uniform:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ{
6sequential_9/random_rotation_4/rotation_matrix/sub_6/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?È
4sequential_9/random_rotation_4/rotation_matrix/sub_6Sub)sequential_9/random_rotation_4/Cast_1:y:0?sequential_9/random_rotation_4/rotation_matrix/sub_6/y:output:0*
T0*
_output_shapes
: Ý
4sequential_9/random_rotation_4/rotation_matrix/mul_2Mul8sequential_9/random_rotation_4/rotation_matrix/Sin_1:y:08sequential_9/random_rotation_4/rotation_matrix/sub_6:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
4sequential_9/random_rotation_4/rotation_matrix/Cos_1Cos3sequential_9/random_rotation_4/stateful_uniform:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ{
6sequential_9/random_rotation_4/rotation_matrix/sub_7/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Æ
4sequential_9/random_rotation_4/rotation_matrix/sub_7Sub'sequential_9/random_rotation_4/Cast:y:0?sequential_9/random_rotation_4/rotation_matrix/sub_7/y:output:0*
T0*
_output_shapes
: Ý
4sequential_9/random_rotation_4/rotation_matrix/mul_3Mul8sequential_9/random_rotation_4/rotation_matrix/Cos_1:y:08sequential_9/random_rotation_4/rotation_matrix/sub_7:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿÝ
2sequential_9/random_rotation_4/rotation_matrix/addAddV28sequential_9/random_rotation_4/rotation_matrix/mul_2:z:08sequential_9/random_rotation_4/rotation_matrix/mul_3:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿÛ
4sequential_9/random_rotation_4/rotation_matrix/sub_8Sub8sequential_9/random_rotation_4/rotation_matrix/sub_5:z:06sequential_9/random_rotation_4/rotation_matrix/add:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
:sequential_9/random_rotation_4/rotation_matrix/truediv_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @ð
8sequential_9/random_rotation_4/rotation_matrix/truediv_1RealDiv8sequential_9/random_rotation_4/rotation_matrix/sub_8:z:0Csequential_9/random_rotation_4/rotation_matrix/truediv_1/y:output:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
4sequential_9/random_rotation_4/rotation_matrix/ShapeShape3sequential_9/random_rotation_4/stateful_uniform:z:0*
T0*
_output_shapes
:
Bsequential_9/random_rotation_4/rotation_matrix/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 
Dsequential_9/random_rotation_4/rotation_matrix/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
Dsequential_9/random_rotation_4/rotation_matrix/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:¼
<sequential_9/random_rotation_4/rotation_matrix/strided_sliceStridedSlice=sequential_9/random_rotation_4/rotation_matrix/Shape:output:0Ksequential_9/random_rotation_4/rotation_matrix/strided_slice/stack:output:0Msequential_9/random_rotation_4/rotation_matrix/strided_slice/stack_1:output:0Msequential_9/random_rotation_4/rotation_matrix/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
4sequential_9/random_rotation_4/rotation_matrix/Cos_2Cos3sequential_9/random_rotation_4/stateful_uniform:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
Dsequential_9/random_rotation_4/rotation_matrix/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"        
Fsequential_9/random_rotation_4/rotation_matrix/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"        
Fsequential_9/random_rotation_4/rotation_matrix/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ï
>sequential_9/random_rotation_4/rotation_matrix/strided_slice_1StridedSlice8sequential_9/random_rotation_4/rotation_matrix/Cos_2:y:0Msequential_9/random_rotation_4/rotation_matrix/strided_slice_1/stack:output:0Osequential_9/random_rotation_4/rotation_matrix/strided_slice_1/stack_1:output:0Osequential_9/random_rotation_4/rotation_matrix/strided_slice_1/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask*
end_mask*
new_axis_mask
4sequential_9/random_rotation_4/rotation_matrix/Sin_2Sin3sequential_9/random_rotation_4/stateful_uniform:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
Dsequential_9/random_rotation_4/rotation_matrix/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB"        
Fsequential_9/random_rotation_4/rotation_matrix/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB"        
Fsequential_9/random_rotation_4/rotation_matrix/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ï
>sequential_9/random_rotation_4/rotation_matrix/strided_slice_2StridedSlice8sequential_9/random_rotation_4/rotation_matrix/Sin_2:y:0Msequential_9/random_rotation_4/rotation_matrix/strided_slice_2/stack:output:0Osequential_9/random_rotation_4/rotation_matrix/strided_slice_2/stack_1:output:0Osequential_9/random_rotation_4/rotation_matrix/strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask*
end_mask*
new_axis_mask´
2sequential_9/random_rotation_4/rotation_matrix/NegNegGsequential_9/random_rotation_4/rotation_matrix/strided_slice_2:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
Dsequential_9/random_rotation_4/rotation_matrix/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB"        
Fsequential_9/random_rotation_4/rotation_matrix/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB"        
Fsequential_9/random_rotation_4/rotation_matrix/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ñ
>sequential_9/random_rotation_4/rotation_matrix/strided_slice_3StridedSlice:sequential_9/random_rotation_4/rotation_matrix/truediv:z:0Msequential_9/random_rotation_4/rotation_matrix/strided_slice_3/stack:output:0Osequential_9/random_rotation_4/rotation_matrix/strided_slice_3/stack_1:output:0Osequential_9/random_rotation_4/rotation_matrix/strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask*
end_mask*
new_axis_mask
4sequential_9/random_rotation_4/rotation_matrix/Sin_3Sin3sequential_9/random_rotation_4/stateful_uniform:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
Dsequential_9/random_rotation_4/rotation_matrix/strided_slice_4/stackConst*
_output_shapes
:*
dtype0*
valueB"        
Fsequential_9/random_rotation_4/rotation_matrix/strided_slice_4/stack_1Const*
_output_shapes
:*
dtype0*
valueB"        
Fsequential_9/random_rotation_4/rotation_matrix/strided_slice_4/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ï
>sequential_9/random_rotation_4/rotation_matrix/strided_slice_4StridedSlice8sequential_9/random_rotation_4/rotation_matrix/Sin_3:y:0Msequential_9/random_rotation_4/rotation_matrix/strided_slice_4/stack:output:0Osequential_9/random_rotation_4/rotation_matrix/strided_slice_4/stack_1:output:0Osequential_9/random_rotation_4/rotation_matrix/strided_slice_4/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask*
end_mask*
new_axis_mask
4sequential_9/random_rotation_4/rotation_matrix/Cos_3Cos3sequential_9/random_rotation_4/stateful_uniform:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
Dsequential_9/random_rotation_4/rotation_matrix/strided_slice_5/stackConst*
_output_shapes
:*
dtype0*
valueB"        
Fsequential_9/random_rotation_4/rotation_matrix/strided_slice_5/stack_1Const*
_output_shapes
:*
dtype0*
valueB"        
Fsequential_9/random_rotation_4/rotation_matrix/strided_slice_5/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ï
>sequential_9/random_rotation_4/rotation_matrix/strided_slice_5StridedSlice8sequential_9/random_rotation_4/rotation_matrix/Cos_3:y:0Msequential_9/random_rotation_4/rotation_matrix/strided_slice_5/stack:output:0Osequential_9/random_rotation_4/rotation_matrix/strided_slice_5/stack_1:output:0Osequential_9/random_rotation_4/rotation_matrix/strided_slice_5/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask*
end_mask*
new_axis_mask
Dsequential_9/random_rotation_4/rotation_matrix/strided_slice_6/stackConst*
_output_shapes
:*
dtype0*
valueB"        
Fsequential_9/random_rotation_4/rotation_matrix/strided_slice_6/stack_1Const*
_output_shapes
:*
dtype0*
valueB"        
Fsequential_9/random_rotation_4/rotation_matrix/strided_slice_6/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ó
>sequential_9/random_rotation_4/rotation_matrix/strided_slice_6StridedSlice<sequential_9/random_rotation_4/rotation_matrix/truediv_1:z:0Msequential_9/random_rotation_4/rotation_matrix/strided_slice_6/stack:output:0Osequential_9/random_rotation_4/rotation_matrix/strided_slice_6/stack_1:output:0Osequential_9/random_rotation_4/rotation_matrix/strided_slice_6/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask*
end_mask*
new_axis_mask
=sequential_9/random_rotation_4/rotation_matrix/zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B :
;sequential_9/random_rotation_4/rotation_matrix/zeros/packedPackEsequential_9/random_rotation_4/rotation_matrix/strided_slice:output:0Fsequential_9/random_rotation_4/rotation_matrix/zeros/packed/1:output:0*
N*
T0*
_output_shapes
:
:sequential_9/random_rotation_4/rotation_matrix/zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    ù
4sequential_9/random_rotation_4/rotation_matrix/zerosFillDsequential_9/random_rotation_4/rotation_matrix/zeros/packed:output:0Csequential_9/random_rotation_4/rotation_matrix/zeros/Const:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ|
:sequential_9/random_rotation_4/rotation_matrix/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :¥
5sequential_9/random_rotation_4/rotation_matrix/concatConcatV2Gsequential_9/random_rotation_4/rotation_matrix/strided_slice_1:output:06sequential_9/random_rotation_4/rotation_matrix/Neg:y:0Gsequential_9/random_rotation_4/rotation_matrix/strided_slice_3:output:0Gsequential_9/random_rotation_4/rotation_matrix/strided_slice_4:output:0Gsequential_9/random_rotation_4/rotation_matrix/strided_slice_5:output:0Gsequential_9/random_rotation_4/rotation_matrix/strided_slice_6:output:0=sequential_9/random_rotation_4/rotation_matrix/zeros:output:0Csequential_9/random_rotation_4/rotation_matrix/concat/axis:output:0*
N*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¡
.sequential_9/random_rotation_4/transform/ShapeShapeCsequential_9/random_flip_4/stateless_random_flip_left_right/add:z:0*
T0*
_output_shapes
:
<sequential_9/random_rotation_4/transform/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:
>sequential_9/random_rotation_4/transform/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
>sequential_9/random_rotation_4/transform/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
6sequential_9/random_rotation_4/transform/strided_sliceStridedSlice7sequential_9/random_rotation_4/transform/Shape:output:0Esequential_9/random_rotation_4/transform/strided_slice/stack:output:0Gsequential_9/random_rotation_4/transform/strided_slice/stack_1:output:0Gsequential_9/random_rotation_4/transform/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:x
3sequential_9/random_rotation_4/transform/fill_valueConst*
_output_shapes
: *
dtype0*
valueB
 *    Ú
Csequential_9/random_rotation_4/transform/ImageProjectiveTransformV3ImageProjectiveTransformV3Csequential_9/random_flip_4/stateless_random_flip_left_right/add:z:0>sequential_9/random_rotation_4/rotation_matrix/concat:output:0?sequential_9/random_rotation_4/transform/strided_slice:output:0<sequential_9/random_rotation_4/transform/fill_value:output:0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà*
dtype0*
	fill_mode	REFLECT*
interpolation
BILINEAR¨
 sequential_9/random_zoom_4/ShapeShapeXsequential_9/random_rotation_4/transform/ImageProjectiveTransformV3:transformed_images:0*
T0*
_output_shapes
:x
.sequential_9/random_zoom_4/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: z
0sequential_9/random_zoom_4/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:z
0sequential_9/random_zoom_4/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ø
(sequential_9/random_zoom_4/strided_sliceStridedSlice)sequential_9/random_zoom_4/Shape:output:07sequential_9/random_zoom_4/strided_slice/stack:output:09sequential_9/random_zoom_4/strided_slice/stack_1:output:09sequential_9/random_zoom_4/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
0sequential_9/random_zoom_4/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:
ýÿÿÿÿÿÿÿÿ
2sequential_9/random_zoom_4/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
þÿÿÿÿÿÿÿÿ|
2sequential_9/random_zoom_4/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:à
*sequential_9/random_zoom_4/strided_slice_1StridedSlice)sequential_9/random_zoom_4/Shape:output:09sequential_9/random_zoom_4/strided_slice_1/stack:output:0;sequential_9/random_zoom_4/strided_slice_1/stack_1:output:0;sequential_9/random_zoom_4/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
sequential_9/random_zoom_4/CastCast3sequential_9/random_zoom_4/strided_slice_1:output:0*

DstT0*

SrcT0*
_output_shapes
: 
0sequential_9/random_zoom_4/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:
þÿÿÿÿÿÿÿÿ
2sequential_9/random_zoom_4/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ|
2sequential_9/random_zoom_4/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:à
*sequential_9/random_zoom_4/strided_slice_2StridedSlice)sequential_9/random_zoom_4/Shape:output:09sequential_9/random_zoom_4/strided_slice_2/stack:output:0;sequential_9/random_zoom_4/strided_slice_2/stack_1:output:0;sequential_9/random_zoom_4/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
!sequential_9/random_zoom_4/Cast_1Cast3sequential_9/random_zoom_4/strided_slice_2:output:0*

DstT0*

SrcT0*
_output_shapes
: u
3sequential_9/random_zoom_4/stateful_uniform/shape/1Const*
_output_shapes
: *
dtype0*
value	B :Ø
1sequential_9/random_zoom_4/stateful_uniform/shapePack1sequential_9/random_zoom_4/strided_slice:output:0<sequential_9/random_zoom_4/stateful_uniform/shape/1:output:0*
N*
T0*
_output_shapes
:t
/sequential_9/random_zoom_4/stateful_uniform/minConst*
_output_shapes
: *
dtype0*
valueB
 *fff?t
/sequential_9/random_zoom_4/stateful_uniform/maxConst*
_output_shapes
: *
dtype0*
valueB
 *ÍÌ?{
1sequential_9/random_zoom_4/stateful_uniform/ConstConst*
_output_shapes
:*
dtype0*
valueB: Ñ
0sequential_9/random_zoom_4/stateful_uniform/ProdProd:sequential_9/random_zoom_4/stateful_uniform/shape:output:0:sequential_9/random_zoom_4/stateful_uniform/Const:output:0*
T0*
_output_shapes
: t
2sequential_9/random_zoom_4/stateful_uniform/Cast/xConst*
_output_shapes
: *
dtype0*
value	B :¥
2sequential_9/random_zoom_4/stateful_uniform/Cast_1Cast9sequential_9/random_zoom_4/stateful_uniform/Prod:output:0*

DstT0*

SrcT0*
_output_shapes
: ¢
:sequential_9/random_zoom_4/stateful_uniform/RngReadAndSkipRngReadAndSkipCsequential_9_random_zoom_4_stateful_uniform_rngreadandskip_resource;sequential_9/random_zoom_4/stateful_uniform/Cast/x:output:06sequential_9/random_zoom_4/stateful_uniform/Cast_1:y:0*
_output_shapes
:
?sequential_9/random_zoom_4/stateful_uniform/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 
Asequential_9/random_zoom_4/stateful_uniform/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
Asequential_9/random_zoom_4/stateful_uniform/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:³
9sequential_9/random_zoom_4/stateful_uniform/strided_sliceStridedSliceBsequential_9/random_zoom_4/stateful_uniform/RngReadAndSkip:value:0Hsequential_9/random_zoom_4/stateful_uniform/strided_slice/stack:output:0Jsequential_9/random_zoom_4/stateful_uniform/strided_slice/stack_1:output:0Jsequential_9/random_zoom_4/stateful_uniform/strided_slice/stack_2:output:0*
Index0*
T0	*
_output_shapes
:*

begin_mask³
3sequential_9/random_zoom_4/stateful_uniform/BitcastBitcastBsequential_9/random_zoom_4/stateful_uniform/strided_slice:output:0*
T0	*
_output_shapes
:*

type0
Asequential_9/random_zoom_4/stateful_uniform/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:
Csequential_9/random_zoom_4/stateful_uniform/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
Csequential_9/random_zoom_4/stateful_uniform/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:©
;sequential_9/random_zoom_4/stateful_uniform/strided_slice_1StridedSliceBsequential_9/random_zoom_4/stateful_uniform/RngReadAndSkip:value:0Jsequential_9/random_zoom_4/stateful_uniform/strided_slice_1/stack:output:0Lsequential_9/random_zoom_4/stateful_uniform/strided_slice_1/stack_1:output:0Lsequential_9/random_zoom_4/stateful_uniform/strided_slice_1/stack_2:output:0*
Index0*
T0	*
_output_shapes
:·
5sequential_9/random_zoom_4/stateful_uniform/Bitcast_1BitcastDsequential_9/random_zoom_4/stateful_uniform/strided_slice_1:output:0*
T0	*
_output_shapes
:*

type0
Hsequential_9/random_zoom_4/stateful_uniform/StatelessRandomUniformV2/algConst*
_output_shapes
: *
dtype0*
value	B :
Dsequential_9/random_zoom_4/stateful_uniform/StatelessRandomUniformV2StatelessRandomUniformV2:sequential_9/random_zoom_4/stateful_uniform/shape:output:0>sequential_9/random_zoom_4/stateful_uniform/Bitcast_1:output:0<sequential_9/random_zoom_4/stateful_uniform/Bitcast:output:0Qsequential_9/random_zoom_4/stateful_uniform/StatelessRandomUniformV2/alg:output:0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿË
/sequential_9/random_zoom_4/stateful_uniform/subSub8sequential_9/random_zoom_4/stateful_uniform/max:output:08sequential_9/random_zoom_4/stateful_uniform/min:output:0*
T0*
_output_shapes
: ì
/sequential_9/random_zoom_4/stateful_uniform/mulMulMsequential_9/random_zoom_4/stateful_uniform/StatelessRandomUniformV2:output:03sequential_9/random_zoom_4/stateful_uniform/sub:z:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿÕ
+sequential_9/random_zoom_4/stateful_uniformAddV23sequential_9/random_zoom_4/stateful_uniform/mul:z:08sequential_9/random_zoom_4/stateful_uniform/min:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿh
&sequential_9/random_zoom_4/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :û
!sequential_9/random_zoom_4/concatConcatV2/sequential_9/random_zoom_4/stateful_uniform:z:0/sequential_9/random_zoom_4/stateful_uniform:z:0/sequential_9/random_zoom_4/concat/axis:output:0*
N*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
,sequential_9/random_zoom_4/zoom_matrix/ShapeShape*sequential_9/random_zoom_4/concat:output:0*
T0*
_output_shapes
:
:sequential_9/random_zoom_4/zoom_matrix/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 
<sequential_9/random_zoom_4/zoom_matrix/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
<sequential_9/random_zoom_4/zoom_matrix/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
4sequential_9/random_zoom_4/zoom_matrix/strided_sliceStridedSlice5sequential_9/random_zoom_4/zoom_matrix/Shape:output:0Csequential_9/random_zoom_4/zoom_matrix/strided_slice/stack:output:0Esequential_9/random_zoom_4/zoom_matrix/strided_slice/stack_1:output:0Esequential_9/random_zoom_4/zoom_matrix/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskq
,sequential_9/random_zoom_4/zoom_matrix/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?°
*sequential_9/random_zoom_4/zoom_matrix/subSub%sequential_9/random_zoom_4/Cast_1:y:05sequential_9/random_zoom_4/zoom_matrix/sub/y:output:0*
T0*
_output_shapes
: u
0sequential_9/random_zoom_4/zoom_matrix/truediv/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @Å
.sequential_9/random_zoom_4/zoom_matrix/truedivRealDiv.sequential_9/random_zoom_4/zoom_matrix/sub:z:09sequential_9/random_zoom_4/zoom_matrix/truediv/y:output:0*
T0*
_output_shapes
: 
<sequential_9/random_zoom_4/zoom_matrix/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*!
valueB"            
>sequential_9/random_zoom_4/zoom_matrix/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*!
valueB"           
>sequential_9/random_zoom_4/zoom_matrix/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*!
valueB"         Ù
6sequential_9/random_zoom_4/zoom_matrix/strided_slice_1StridedSlice*sequential_9/random_zoom_4/concat:output:0Esequential_9/random_zoom_4/zoom_matrix/strided_slice_1/stack:output:0Gsequential_9/random_zoom_4/zoom_matrix/strided_slice_1/stack_1:output:0Gsequential_9/random_zoom_4/zoom_matrix/strided_slice_1/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask*
end_mask*
new_axis_mask*
shrink_axis_masks
.sequential_9/random_zoom_4/zoom_matrix/sub_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?ß
,sequential_9/random_zoom_4/zoom_matrix/sub_1Sub7sequential_9/random_zoom_4/zoom_matrix/sub_1/x:output:0?sequential_9/random_zoom_4/zoom_matrix/strided_slice_1:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿÉ
*sequential_9/random_zoom_4/zoom_matrix/mulMul2sequential_9/random_zoom_4/zoom_matrix/truediv:z:00sequential_9/random_zoom_4/zoom_matrix/sub_1:z:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿs
.sequential_9/random_zoom_4/zoom_matrix/sub_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?²
,sequential_9/random_zoom_4/zoom_matrix/sub_2Sub#sequential_9/random_zoom_4/Cast:y:07sequential_9/random_zoom_4/zoom_matrix/sub_2/y:output:0*
T0*
_output_shapes
: w
2sequential_9/random_zoom_4/zoom_matrix/truediv_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @Ë
0sequential_9/random_zoom_4/zoom_matrix/truediv_1RealDiv0sequential_9/random_zoom_4/zoom_matrix/sub_2:z:0;sequential_9/random_zoom_4/zoom_matrix/truediv_1/y:output:0*
T0*
_output_shapes
: 
<sequential_9/random_zoom_4/zoom_matrix/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*!
valueB"           
>sequential_9/random_zoom_4/zoom_matrix/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*!
valueB"           
>sequential_9/random_zoom_4/zoom_matrix/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*!
valueB"         Ù
6sequential_9/random_zoom_4/zoom_matrix/strided_slice_2StridedSlice*sequential_9/random_zoom_4/concat:output:0Esequential_9/random_zoom_4/zoom_matrix/strided_slice_2/stack:output:0Gsequential_9/random_zoom_4/zoom_matrix/strided_slice_2/stack_1:output:0Gsequential_9/random_zoom_4/zoom_matrix/strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask*
end_mask*
new_axis_mask*
shrink_axis_masks
.sequential_9/random_zoom_4/zoom_matrix/sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?ß
,sequential_9/random_zoom_4/zoom_matrix/sub_3Sub7sequential_9/random_zoom_4/zoom_matrix/sub_3/x:output:0?sequential_9/random_zoom_4/zoom_matrix/strided_slice_2:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿÍ
,sequential_9/random_zoom_4/zoom_matrix/mul_1Mul4sequential_9/random_zoom_4/zoom_matrix/truediv_1:z:00sequential_9/random_zoom_4/zoom_matrix/sub_3:z:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
<sequential_9/random_zoom_4/zoom_matrix/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*!
valueB"            
>sequential_9/random_zoom_4/zoom_matrix/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*!
valueB"           
>sequential_9/random_zoom_4/zoom_matrix/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*!
valueB"         Ù
6sequential_9/random_zoom_4/zoom_matrix/strided_slice_3StridedSlice*sequential_9/random_zoom_4/concat:output:0Esequential_9/random_zoom_4/zoom_matrix/strided_slice_3/stack:output:0Gsequential_9/random_zoom_4/zoom_matrix/strided_slice_3/stack_1:output:0Gsequential_9/random_zoom_4/zoom_matrix/strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask*
end_mask*
new_axis_mask*
shrink_axis_maskw
5sequential_9/random_zoom_4/zoom_matrix/zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B :è
3sequential_9/random_zoom_4/zoom_matrix/zeros/packedPack=sequential_9/random_zoom_4/zoom_matrix/strided_slice:output:0>sequential_9/random_zoom_4/zoom_matrix/zeros/packed/1:output:0*
N*
T0*
_output_shapes
:w
2sequential_9/random_zoom_4/zoom_matrix/zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    á
,sequential_9/random_zoom_4/zoom_matrix/zerosFill<sequential_9/random_zoom_4/zoom_matrix/zeros/packed:output:0;sequential_9/random_zoom_4/zoom_matrix/zeros/Const:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿy
7sequential_9/random_zoom_4/zoom_matrix/zeros_1/packed/1Const*
_output_shapes
: *
dtype0*
value	B :ì
5sequential_9/random_zoom_4/zoom_matrix/zeros_1/packedPack=sequential_9/random_zoom_4/zoom_matrix/strided_slice:output:0@sequential_9/random_zoom_4/zoom_matrix/zeros_1/packed/1:output:0*
N*
T0*
_output_shapes
:y
4sequential_9/random_zoom_4/zoom_matrix/zeros_1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    ç
.sequential_9/random_zoom_4/zoom_matrix/zeros_1Fill>sequential_9/random_zoom_4/zoom_matrix/zeros_1/packed:output:0=sequential_9/random_zoom_4/zoom_matrix/zeros_1/Const:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
<sequential_9/random_zoom_4/zoom_matrix/strided_slice_4/stackConst*
_output_shapes
:*
dtype0*!
valueB"           
>sequential_9/random_zoom_4/zoom_matrix/strided_slice_4/stack_1Const*
_output_shapes
:*
dtype0*!
valueB"           
>sequential_9/random_zoom_4/zoom_matrix/strided_slice_4/stack_2Const*
_output_shapes
:*
dtype0*!
valueB"         Ù
6sequential_9/random_zoom_4/zoom_matrix/strided_slice_4StridedSlice*sequential_9/random_zoom_4/concat:output:0Esequential_9/random_zoom_4/zoom_matrix/strided_slice_4/stack:output:0Gsequential_9/random_zoom_4/zoom_matrix/strided_slice_4/stack_1:output:0Gsequential_9/random_zoom_4/zoom_matrix/strided_slice_4/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask*
end_mask*
new_axis_mask*
shrink_axis_masky
7sequential_9/random_zoom_4/zoom_matrix/zeros_2/packed/1Const*
_output_shapes
: *
dtype0*
value	B :ì
5sequential_9/random_zoom_4/zoom_matrix/zeros_2/packedPack=sequential_9/random_zoom_4/zoom_matrix/strided_slice:output:0@sequential_9/random_zoom_4/zoom_matrix/zeros_2/packed/1:output:0*
N*
T0*
_output_shapes
:y
4sequential_9/random_zoom_4/zoom_matrix/zeros_2/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    ç
.sequential_9/random_zoom_4/zoom_matrix/zeros_2Fill>sequential_9/random_zoom_4/zoom_matrix/zeros_2/packed:output:0=sequential_9/random_zoom_4/zoom_matrix/zeros_2/Const:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿt
2sequential_9/random_zoom_4/zoom_matrix/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :¾
-sequential_9/random_zoom_4/zoom_matrix/concatConcatV2?sequential_9/random_zoom_4/zoom_matrix/strided_slice_3:output:05sequential_9/random_zoom_4/zoom_matrix/zeros:output:0.sequential_9/random_zoom_4/zoom_matrix/mul:z:07sequential_9/random_zoom_4/zoom_matrix/zeros_1:output:0?sequential_9/random_zoom_4/zoom_matrix/strided_slice_4:output:00sequential_9/random_zoom_4/zoom_matrix/mul_1:z:07sequential_9/random_zoom_4/zoom_matrix/zeros_2:output:0;sequential_9/random_zoom_4/zoom_matrix/concat/axis:output:0*
N*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ²
*sequential_9/random_zoom_4/transform/ShapeShapeXsequential_9/random_rotation_4/transform/ImageProjectiveTransformV3:transformed_images:0*
T0*
_output_shapes
:
8sequential_9/random_zoom_4/transform/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:
:sequential_9/random_zoom_4/transform/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
:sequential_9/random_zoom_4/transform/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ö
2sequential_9/random_zoom_4/transform/strided_sliceStridedSlice3sequential_9/random_zoom_4/transform/Shape:output:0Asequential_9/random_zoom_4/transform/strided_slice/stack:output:0Csequential_9/random_zoom_4/transform/strided_slice/stack_1:output:0Csequential_9/random_zoom_4/transform/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:t
/sequential_9/random_zoom_4/transform/fill_valueConst*
_output_shapes
: *
dtype0*
valueB
 *    Û
?sequential_9/random_zoom_4/transform/ImageProjectiveTransformV3ImageProjectiveTransformV3Xsequential_9/random_rotation_4/transform/ImageProjectiveTransformV3:transformed_images:06sequential_9/random_zoom_4/zoom_matrix/concat:output:0;sequential_9/random_zoom_4/transform/strided_slice:output:08sequential_9/random_zoom_4/transform/fill_value:output:0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà*
dtype0*
	fill_mode	REFLECT*
interpolation
BILINEARW
rescaling_9/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *;Y
rescaling_9/Cast_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *    Å
rescaling_9/mulMulTsequential_9/random_zoom_4/transform/ImageProjectiveTransformV3:transformed_images:0rescaling_9/Cast/x:output:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
rescaling_9/addAddV2rescaling_9/mul:z:0rescaling_9/Cast_1/x:output:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
conv2d_24/Conv2D/ReadVariableOpReadVariableOp(conv2d_24_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0¼
conv2d_24/Conv2DConv2Drescaling_9/add:z:0'conv2d_24/Conv2D/ReadVariableOp:value:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà*
paddingSAME*
strides

 conv2d_24/BiasAdd/ReadVariableOpReadVariableOp)conv2d_24_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0
conv2d_24/BiasAddBiasAddconv2d_24/Conv2D:output:0(conv2d_24/BiasAdd/ReadVariableOp:value:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿààn
conv2d_24/ReluReluconv2d_24/BiasAdd:output:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà®
max_pooling2d_24/MaxPoolMaxPoolconv2d_24/Relu:activations:0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿpp*
ksize
*
paddingVALID*
strides

conv2d_25/Conv2D/ReadVariableOpReadVariableOp(conv2d_25_conv2d_readvariableop_resource*&
_output_shapes
: *
dtype0È
conv2d_25/Conv2DConv2D!max_pooling2d_24/MaxPool:output:0'conv2d_25/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿpp *
paddingSAME*
strides

 conv2d_25/BiasAdd/ReadVariableOpReadVariableOp)conv2d_25_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0
conv2d_25/BiasAddBiasAddconv2d_25/Conv2D:output:0(conv2d_25/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿpp l
conv2d_25/ReluReluconv2d_25/BiasAdd:output:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿpp ®
max_pooling2d_25/MaxPoolMaxPoolconv2d_25/Relu:activations:0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ88 *
ksize
*
paddingVALID*
strides

conv2d_26/Conv2D/ReadVariableOpReadVariableOp(conv2d_26_conv2d_readvariableop_resource*&
_output_shapes
: @*
dtype0È
conv2d_26/Conv2DConv2D!max_pooling2d_25/MaxPool:output:0'conv2d_26/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ88@*
paddingSAME*
strides

 conv2d_26/BiasAdd/ReadVariableOpReadVariableOp)conv2d_26_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0
conv2d_26/BiasAddBiasAddconv2d_26/Conv2D:output:0(conv2d_26/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ88@l
conv2d_26/ReluReluconv2d_26/BiasAdd:output:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ88@®
max_pooling2d_26/MaxPoolMaxPoolconv2d_26/Relu:activations:0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@*
ksize
*
paddingVALID*
strides
\
dropout_8/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   ?
dropout_8/dropout/MulMul!max_pooling2d_26/MaxPool:output:0 dropout_8/dropout/Const:output:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@h
dropout_8/dropout/ShapeShape!max_pooling2d_26/MaxPool:output:0*
T0*
_output_shapes
:¨
.dropout_8/dropout/random_uniform/RandomUniformRandomUniform dropout_8/dropout/Shape:output:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@*
dtype0e
 dropout_8/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *ÍÌL>Ì
dropout_8/dropout/GreaterEqualGreaterEqual7dropout_8/dropout/random_uniform/RandomUniform:output:0)dropout_8/dropout/GreaterEqual/y:output:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@
dropout_8/dropout/CastCast"dropout_8/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@
dropout_8/dropout/Mul_1Muldropout_8/dropout/Mul:z:0dropout_8/dropout/Cast:y:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@`
flatten_8/ConstConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ Ä  
flatten_8/ReshapeReshapedropout_8/dropout/Mul_1:z:0flatten_8/Const:output:0*
T0*)
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
dense_16/MatMul/ReadVariableOpReadVariableOp'dense_16_matmul_readvariableop_resource*!
_output_shapes
:*
dtype0
dense_16/MatMulMatMulflatten_8/Reshape:output:0&dense_16/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
dense_16/BiasAdd/ReadVariableOpReadVariableOp(dense_16_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0
dense_16/BiasAddBiasAdddense_16/MatMul:product:0'dense_16/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
dense_16/ReluReludense_16/BiasAdd:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
dense_17/MatMul/ReadVariableOpReadVariableOp'dense_17_matmul_readvariableop_resource*
_output_shapes
:	*
dtype0
dense_17/MatMulMatMuldense_16/Relu:activations:0&dense_17/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
dense_17/BiasAdd/ReadVariableOpReadVariableOp(dense_17_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0
dense_17/BiasAddBiasAdddense_17/MatMul:product:0'dense_17/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿh
dense_17/SigmoidSigmoiddense_17/BiasAdd:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
IdentityIdentitydense_17/Sigmoid:y:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿß
NoOpNoOp!^conv2d_24/BiasAdd/ReadVariableOp ^conv2d_24/Conv2D/ReadVariableOp!^conv2d_25/BiasAdd/ReadVariableOp ^conv2d_25/Conv2D/ReadVariableOp!^conv2d_26/BiasAdd/ReadVariableOp ^conv2d_26/Conv2D/ReadVariableOp ^dense_16/BiasAdd/ReadVariableOp^dense_16/MatMul/ReadVariableOp ^dense_17/BiasAdd/ReadVariableOp^dense_17/MatMul/ReadVariableOpD^sequential_9/random_flip_4/stateful_uniform_full_int/RngReadAndSkip?^sequential_9/random_rotation_4/stateful_uniform/RngReadAndSkip;^sequential_9/random_zoom_4/stateful_uniform/RngReadAndSkip*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*J
_input_shapes9
7:ÿÿÿÿÿÿÿÿÿàà: : : : : : : : : : : : : 2D
 conv2d_24/BiasAdd/ReadVariableOp conv2d_24/BiasAdd/ReadVariableOp2B
conv2d_24/Conv2D/ReadVariableOpconv2d_24/Conv2D/ReadVariableOp2D
 conv2d_25/BiasAdd/ReadVariableOp conv2d_25/BiasAdd/ReadVariableOp2B
conv2d_25/Conv2D/ReadVariableOpconv2d_25/Conv2D/ReadVariableOp2D
 conv2d_26/BiasAdd/ReadVariableOp conv2d_26/BiasAdd/ReadVariableOp2B
conv2d_26/Conv2D/ReadVariableOpconv2d_26/Conv2D/ReadVariableOp2B
dense_16/BiasAdd/ReadVariableOpdense_16/BiasAdd/ReadVariableOp2@
dense_16/MatMul/ReadVariableOpdense_16/MatMul/ReadVariableOp2B
dense_17/BiasAdd/ReadVariableOpdense_17/BiasAdd/ReadVariableOp2@
dense_17/MatMul/ReadVariableOpdense_17/MatMul/ReadVariableOp2
Csequential_9/random_flip_4/stateful_uniform_full_int/RngReadAndSkipCsequential_9/random_flip_4/stateful_uniform_full_int/RngReadAndSkip2
>sequential_9/random_rotation_4/stateful_uniform/RngReadAndSkip>sequential_9/random_rotation_4/stateful_uniform/RngReadAndSkip2x
:sequential_9/random_zoom_4/stateful_uniform/RngReadAndSkip:sequential_9/random_zoom_4/stateful_uniform/RngReadAndSkip:Y U
1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
 
_user_specified_nameinputs
Â
}
-__inference_random_zoom_4_layer_call_fn_48886

inputs
unknown:	
identity¢StatefulPartitionedCall×
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *Q
fLRJ
H__inference_random_zoom_4_layer_call_and_return_conditional_losses_46995y
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:ÿÿÿÿÿÿÿÿÿàà: 22
StatefulPartitionedCallStatefulPartitionedCall:Y U
1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
 
_user_specified_nameinputs
ò
U
,__inference_sequential_9_layer_call_fn_46885
random_flip_4_input
identityÉ
PartitionedCallPartitionedCallrandom_flip_4_input*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_sequential_9_layer_call_and_return_conditional_losses_46882j
IdentityIdentityPartitionedCall:output:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿàà:f b
1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
-
_user_specified_namerandom_flip_4_input
n
Á
H__inference_random_zoom_4_layer_call_and_return_conditional_losses_48992

inputs6
(stateful_uniform_rngreadandskip_resource:	
identity¢stateful_uniform/RngReadAndSkip;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ñ
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskh
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:
ýÿÿÿÿÿÿÿÿj
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
þÿÿÿÿÿÿÿÿa
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ù
strided_slice_1StridedSliceShape:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskV
CastCaststrided_slice_1:output:0*

DstT0*

SrcT0*
_output_shapes
: h
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:
þÿÿÿÿÿÿÿÿj
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿa
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ù
strided_slice_2StridedSliceShape:output:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskX
Cast_1Caststrided_slice_2:output:0*

DstT0*

SrcT0*
_output_shapes
: Z
stateful_uniform/shape/1Const*
_output_shapes
: *
dtype0*
value	B :
stateful_uniform/shapePackstrided_slice:output:0!stateful_uniform/shape/1:output:0*
N*
T0*
_output_shapes
:Y
stateful_uniform/minConst*
_output_shapes
: *
dtype0*
valueB
 *fff?Y
stateful_uniform/maxConst*
_output_shapes
: *
dtype0*
valueB
 *ÍÌ?`
stateful_uniform/ConstConst*
_output_shapes
:*
dtype0*
valueB: 
stateful_uniform/ProdProdstateful_uniform/shape:output:0stateful_uniform/Const:output:0*
T0*
_output_shapes
: Y
stateful_uniform/Cast/xConst*
_output_shapes
: *
dtype0*
value	B :o
stateful_uniform/Cast_1Caststateful_uniform/Prod:output:0*

DstT0*

SrcT0*
_output_shapes
: ¶
stateful_uniform/RngReadAndSkipRngReadAndSkip(stateful_uniform_rngreadandskip_resource stateful_uniform/Cast/x:output:0stateful_uniform/Cast_1:y:0*
_output_shapes
:n
$stateful_uniform/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: p
&stateful_uniform/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:p
&stateful_uniform/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:¬
stateful_uniform/strided_sliceStridedSlice'stateful_uniform/RngReadAndSkip:value:0-stateful_uniform/strided_slice/stack:output:0/stateful_uniform/strided_slice/stack_1:output:0/stateful_uniform/strided_slice/stack_2:output:0*
Index0*
T0	*
_output_shapes
:*

begin_mask}
stateful_uniform/BitcastBitcast'stateful_uniform/strided_slice:output:0*
T0	*
_output_shapes
:*

type0p
&stateful_uniform/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:r
(stateful_uniform/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:r
(stateful_uniform/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:¢
 stateful_uniform/strided_slice_1StridedSlice'stateful_uniform/RngReadAndSkip:value:0/stateful_uniform/strided_slice_1/stack:output:01stateful_uniform/strided_slice_1/stack_1:output:01stateful_uniform/strided_slice_1/stack_2:output:0*
Index0*
T0	*
_output_shapes
:
stateful_uniform/Bitcast_1Bitcast)stateful_uniform/strided_slice_1:output:0*
T0	*
_output_shapes
:*

type0o
-stateful_uniform/StatelessRandomUniformV2/algConst*
_output_shapes
: *
dtype0*
value	B :
)stateful_uniform/StatelessRandomUniformV2StatelessRandomUniformV2stateful_uniform/shape:output:0#stateful_uniform/Bitcast_1:output:0!stateful_uniform/Bitcast:output:06stateful_uniform/StatelessRandomUniformV2/alg:output:0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿz
stateful_uniform/subSubstateful_uniform/max:output:0stateful_uniform/min:output:0*
T0*
_output_shapes
: 
stateful_uniform/mulMul2stateful_uniform/StatelessRandomUniformV2:output:0stateful_uniform/sub:z:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
stateful_uniformAddV2stateful_uniform/mul:z:0stateful_uniform/min:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿM
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :
concatConcatV2stateful_uniform:z:0stateful_uniform:z:0concat/axis:output:0*
N*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿP
zoom_matrix/ShapeShapeconcat:output:0*
T0*
_output_shapes
:i
zoom_matrix/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: k
!zoom_matrix/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:k
!zoom_matrix/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
zoom_matrix/strided_sliceStridedSlicezoom_matrix/Shape:output:0(zoom_matrix/strided_slice/stack:output:0*zoom_matrix/strided_slice/stack_1:output:0*zoom_matrix/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskV
zoom_matrix/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?_
zoom_matrix/subSub
Cast_1:y:0zoom_matrix/sub/y:output:0*
T0*
_output_shapes
: Z
zoom_matrix/truediv/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @t
zoom_matrix/truedivRealDivzoom_matrix/sub:z:0zoom_matrix/truediv/y:output:0*
T0*
_output_shapes
: v
!zoom_matrix/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*!
valueB"            x
#zoom_matrix/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*!
valueB"           x
#zoom_matrix/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*!
valueB"         Ò
zoom_matrix/strided_slice_1StridedSliceconcat:output:0*zoom_matrix/strided_slice_1/stack:output:0,zoom_matrix/strided_slice_1/stack_1:output:0,zoom_matrix/strided_slice_1/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask*
end_mask*
new_axis_mask*
shrink_axis_maskX
zoom_matrix/sub_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
zoom_matrix/sub_1Subzoom_matrix/sub_1/x:output:0$zoom_matrix/strided_slice_1:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿx
zoom_matrix/mulMulzoom_matrix/truediv:z:0zoom_matrix/sub_1:z:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿX
zoom_matrix/sub_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?a
zoom_matrix/sub_2SubCast:y:0zoom_matrix/sub_2/y:output:0*
T0*
_output_shapes
: \
zoom_matrix/truediv_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @z
zoom_matrix/truediv_1RealDivzoom_matrix/sub_2:z:0 zoom_matrix/truediv_1/y:output:0*
T0*
_output_shapes
: v
!zoom_matrix/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*!
valueB"           x
#zoom_matrix/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*!
valueB"           x
#zoom_matrix/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*!
valueB"         Ò
zoom_matrix/strided_slice_2StridedSliceconcat:output:0*zoom_matrix/strided_slice_2/stack:output:0,zoom_matrix/strided_slice_2/stack_1:output:0,zoom_matrix/strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask*
end_mask*
new_axis_mask*
shrink_axis_maskX
zoom_matrix/sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
zoom_matrix/sub_3Subzoom_matrix/sub_3/x:output:0$zoom_matrix/strided_slice_2:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ|
zoom_matrix/mul_1Mulzoom_matrix/truediv_1:z:0zoom_matrix/sub_3:z:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿv
!zoom_matrix/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*!
valueB"            x
#zoom_matrix/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*!
valueB"           x
#zoom_matrix/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*!
valueB"         Ò
zoom_matrix/strided_slice_3StridedSliceconcat:output:0*zoom_matrix/strided_slice_3/stack:output:0,zoom_matrix/strided_slice_3/stack_1:output:0,zoom_matrix/strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask*
end_mask*
new_axis_mask*
shrink_axis_mask\
zoom_matrix/zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B :
zoom_matrix/zeros/packedPack"zoom_matrix/strided_slice:output:0#zoom_matrix/zeros/packed/1:output:0*
N*
T0*
_output_shapes
:\
zoom_matrix/zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
zoom_matrix/zerosFill!zoom_matrix/zeros/packed:output:0 zoom_matrix/zeros/Const:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ^
zoom_matrix/zeros_1/packed/1Const*
_output_shapes
: *
dtype0*
value	B :
zoom_matrix/zeros_1/packedPack"zoom_matrix/strided_slice:output:0%zoom_matrix/zeros_1/packed/1:output:0*
N*
T0*
_output_shapes
:^
zoom_matrix/zeros_1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
zoom_matrix/zeros_1Fill#zoom_matrix/zeros_1/packed:output:0"zoom_matrix/zeros_1/Const:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿv
!zoom_matrix/strided_slice_4/stackConst*
_output_shapes
:*
dtype0*!
valueB"           x
#zoom_matrix/strided_slice_4/stack_1Const*
_output_shapes
:*
dtype0*!
valueB"           x
#zoom_matrix/strided_slice_4/stack_2Const*
_output_shapes
:*
dtype0*!
valueB"         Ò
zoom_matrix/strided_slice_4StridedSliceconcat:output:0*zoom_matrix/strided_slice_4/stack:output:0,zoom_matrix/strided_slice_4/stack_1:output:0,zoom_matrix/strided_slice_4/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask*
end_mask*
new_axis_mask*
shrink_axis_mask^
zoom_matrix/zeros_2/packed/1Const*
_output_shapes
: *
dtype0*
value	B :
zoom_matrix/zeros_2/packedPack"zoom_matrix/strided_slice:output:0%zoom_matrix/zeros_2/packed/1:output:0*
N*
T0*
_output_shapes
:^
zoom_matrix/zeros_2/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
zoom_matrix/zeros_2Fill#zoom_matrix/zeros_2/packed:output:0"zoom_matrix/zeros_2/Const:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿY
zoom_matrix/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :Ë
zoom_matrix/concatConcatV2$zoom_matrix/strided_slice_3:output:0zoom_matrix/zeros:output:0zoom_matrix/mul:z:0zoom_matrix/zeros_1:output:0$zoom_matrix/strided_slice_4:output:0zoom_matrix/mul_1:z:0zoom_matrix/zeros_2:output:0 zoom_matrix/concat/axis:output:0*
N*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿE
transform/ShapeShapeinputs*
T0*
_output_shapes
:g
transform/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:i
transform/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:i
transform/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ï
transform/strided_sliceStridedSlicetransform/Shape:output:0&transform/strided_slice/stack:output:0(transform/strided_slice/stack_1:output:0(transform/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:Y
transform/fill_valueConst*
_output_shapes
: *
dtype0*
valueB
 *    
$transform/ImageProjectiveTransformV3ImageProjectiveTransformV3inputszoom_matrix/concat:output:0 transform/strided_slice:output:0transform/fill_value:output:0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà*
dtype0*
	fill_mode	REFLECT*
interpolation
BILINEAR
IdentityIdentity9transform/ImageProjectiveTransformV3:transformed_images:0^NoOp*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿààh
NoOpNoOp ^stateful_uniform/RngReadAndSkip*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:ÿÿÿÿÿÿÿÿÿàà: 2B
stateful_uniform/RngReadAndSkipstateful_uniform/RngReadAndSkip:Y U
1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
 
_user_specified_nameinputs
:

H__inference_sequential_13_layer_call_and_return_conditional_losses_47846

inputsB
(conv2d_24_conv2d_readvariableop_resource:7
)conv2d_24_biasadd_readvariableop_resource:B
(conv2d_25_conv2d_readvariableop_resource: 7
)conv2d_25_biasadd_readvariableop_resource: B
(conv2d_26_conv2d_readvariableop_resource: @7
)conv2d_26_biasadd_readvariableop_resource:@<
'dense_16_matmul_readvariableop_resource:7
(dense_16_biasadd_readvariableop_resource:	:
'dense_17_matmul_readvariableop_resource:	6
(dense_17_biasadd_readvariableop_resource:
identity¢ conv2d_24/BiasAdd/ReadVariableOp¢conv2d_24/Conv2D/ReadVariableOp¢ conv2d_25/BiasAdd/ReadVariableOp¢conv2d_25/Conv2D/ReadVariableOp¢ conv2d_26/BiasAdd/ReadVariableOp¢conv2d_26/Conv2D/ReadVariableOp¢dense_16/BiasAdd/ReadVariableOp¢dense_16/MatMul/ReadVariableOp¢dense_17/BiasAdd/ReadVariableOp¢dense_17/MatMul/ReadVariableOpW
rescaling_9/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *;Y
rescaling_9/Cast_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *    w
rescaling_9/mulMulinputsrescaling_9/Cast/x:output:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
rescaling_9/addAddV2rescaling_9/mul:z:0rescaling_9/Cast_1/x:output:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
conv2d_24/Conv2D/ReadVariableOpReadVariableOp(conv2d_24_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0¼
conv2d_24/Conv2DConv2Drescaling_9/add:z:0'conv2d_24/Conv2D/ReadVariableOp:value:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà*
paddingSAME*
strides

 conv2d_24/BiasAdd/ReadVariableOpReadVariableOp)conv2d_24_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0
conv2d_24/BiasAddBiasAddconv2d_24/Conv2D:output:0(conv2d_24/BiasAdd/ReadVariableOp:value:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿààn
conv2d_24/ReluReluconv2d_24/BiasAdd:output:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà®
max_pooling2d_24/MaxPoolMaxPoolconv2d_24/Relu:activations:0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿpp*
ksize
*
paddingVALID*
strides

conv2d_25/Conv2D/ReadVariableOpReadVariableOp(conv2d_25_conv2d_readvariableop_resource*&
_output_shapes
: *
dtype0È
conv2d_25/Conv2DConv2D!max_pooling2d_24/MaxPool:output:0'conv2d_25/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿpp *
paddingSAME*
strides

 conv2d_25/BiasAdd/ReadVariableOpReadVariableOp)conv2d_25_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0
conv2d_25/BiasAddBiasAddconv2d_25/Conv2D:output:0(conv2d_25/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿpp l
conv2d_25/ReluReluconv2d_25/BiasAdd:output:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿpp ®
max_pooling2d_25/MaxPoolMaxPoolconv2d_25/Relu:activations:0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ88 *
ksize
*
paddingVALID*
strides

conv2d_26/Conv2D/ReadVariableOpReadVariableOp(conv2d_26_conv2d_readvariableop_resource*&
_output_shapes
: @*
dtype0È
conv2d_26/Conv2DConv2D!max_pooling2d_25/MaxPool:output:0'conv2d_26/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ88@*
paddingSAME*
strides

 conv2d_26/BiasAdd/ReadVariableOpReadVariableOp)conv2d_26_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0
conv2d_26/BiasAddBiasAddconv2d_26/Conv2D:output:0(conv2d_26/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ88@l
conv2d_26/ReluReluconv2d_26/BiasAdd:output:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ88@®
max_pooling2d_26/MaxPoolMaxPoolconv2d_26/Relu:activations:0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@*
ksize
*
paddingVALID*
strides
{
dropout_8/IdentityIdentity!max_pooling2d_26/MaxPool:output:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@`
flatten_8/ConstConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ Ä  
flatten_8/ReshapeReshapedropout_8/Identity:output:0flatten_8/Const:output:0*
T0*)
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
dense_16/MatMul/ReadVariableOpReadVariableOp'dense_16_matmul_readvariableop_resource*!
_output_shapes
:*
dtype0
dense_16/MatMulMatMulflatten_8/Reshape:output:0&dense_16/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
dense_16/BiasAdd/ReadVariableOpReadVariableOp(dense_16_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0
dense_16/BiasAddBiasAdddense_16/MatMul:product:0'dense_16/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
dense_16/ReluReludense_16/BiasAdd:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
dense_17/MatMul/ReadVariableOpReadVariableOp'dense_17_matmul_readvariableop_resource*
_output_shapes
:	*
dtype0
dense_17/MatMulMatMuldense_16/Relu:activations:0&dense_17/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
dense_17/BiasAdd/ReadVariableOpReadVariableOp(dense_17_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0
dense_17/BiasAddBiasAdddense_17/MatMul:product:0'dense_17/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿh
dense_17/SigmoidSigmoiddense_17/BiasAdd:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
IdentityIdentitydense_17/Sigmoid:y:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
NoOpNoOp!^conv2d_24/BiasAdd/ReadVariableOp ^conv2d_24/Conv2D/ReadVariableOp!^conv2d_25/BiasAdd/ReadVariableOp ^conv2d_25/Conv2D/ReadVariableOp!^conv2d_26/BiasAdd/ReadVariableOp ^conv2d_26/Conv2D/ReadVariableOp ^dense_16/BiasAdd/ReadVariableOp^dense_16/MatMul/ReadVariableOp ^dense_17/BiasAdd/ReadVariableOp^dense_17/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:ÿÿÿÿÿÿÿÿÿàà: : : : : : : : : : 2D
 conv2d_24/BiasAdd/ReadVariableOp conv2d_24/BiasAdd/ReadVariableOp2B
conv2d_24/Conv2D/ReadVariableOpconv2d_24/Conv2D/ReadVariableOp2D
 conv2d_25/BiasAdd/ReadVariableOp conv2d_25/BiasAdd/ReadVariableOp2B
conv2d_25/Conv2D/ReadVariableOpconv2d_25/Conv2D/ReadVariableOp2D
 conv2d_26/BiasAdd/ReadVariableOp conv2d_26/BiasAdd/ReadVariableOp2B
conv2d_26/Conv2D/ReadVariableOpconv2d_26/Conv2D/ReadVariableOp2B
dense_16/BiasAdd/ReadVariableOpdense_16/BiasAdd/ReadVariableOp2@
dense_16/MatMul/ReadVariableOpdense_16/MatMul/ReadVariableOp2B
dense_17/BiasAdd/ReadVariableOpdense_17/BiasAdd/ReadVariableOp2@
dense_17/MatMul/ReadVariableOpdense_17/MatMul/ReadVariableOp:Y U
1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
 
_user_specified_nameinputs
¸
L
0__inference_max_pooling2d_24_layer_call_fn_48523

inputs
identityÙ
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *J
_output_shapes8
6:4ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *T
fORM
K__inference_max_pooling2d_24_layer_call_and_return_conditional_losses_47271
IdentityIdentityPartitionedCall:output:0*
T0*J
_output_shapes8
6:4ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:r n
J
_output_shapes8
6:4ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs

c
G__inference_sequential_9_layer_call_and_return_conditional_losses_48215

inputs
identityX
IdentityIdentityinputs*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿàà:Y U
1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
 
_user_specified_nameinputs
½


#__inference_signature_wrapper_48195
sequential_9_input!
unknown:
	unknown_0:#
	unknown_1: 
	unknown_2: #
	unknown_3: @
	unknown_4:@
	unknown_5:
	unknown_6:	
	unknown_7:	
	unknown_8:
identity¢StatefulPartitionedCall©
StatefulPartitionedCallStatefulPartitionedCallsequential_9_inputunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*,
_read_only_resource_inputs

	
*-
config_proto

CPU

GPU 2J 8 *)
f$R"
 __inference__wrapped_model_46856o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:ÿÿÿÿÿÿÿÿÿàà: : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:e a
1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
,
_user_specified_namesequential_9_input
ë
c
G__inference_sequential_9_layer_call_and_return_conditional_losses_46882

inputs
identityË
random_flip_4/PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *Q
fLRJ
H__inference_random_flip_4_layer_call_and_return_conditional_losses_46867ó
!random_rotation_4/PartitionedCallPartitionedCall&random_flip_4/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *U
fPRN
L__inference_random_rotation_4_layer_call_and_return_conditional_losses_46873ï
random_zoom_4/PartitionedCallPartitionedCall*random_rotation_4/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *Q
fLRJ
H__inference_random_zoom_4_layer_call_and_return_conditional_losses_46879x
IdentityIdentity&random_zoom_4/PartitionedCall:output:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿàà:Y U
1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
 
_user_specified_nameinputs
Ø
Ü
G__inference_sequential_9_layer_call_and_return_conditional_losses_47262
random_flip_4_input!
random_flip_4_47252:	%
random_rotation_4_47255:	!
random_zoom_4_47258:	
identity¢%random_flip_4/StatefulPartitionedCall¢)random_rotation_4/StatefulPartitionedCall¢%random_zoom_4/StatefulPartitionedCallþ
%random_flip_4/StatefulPartitionedCallStatefulPartitionedCallrandom_flip_4_inputrandom_flip_4_47252*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *Q
fLRJ
H__inference_random_flip_4_layer_call_and_return_conditional_losses_47197¥
)random_rotation_4/StatefulPartitionedCallStatefulPartitionedCall.random_flip_4/StatefulPartitionedCall:output:0random_rotation_4_47255*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *U
fPRN
L__inference_random_rotation_4_layer_call_and_return_conditional_losses_47126
%random_zoom_4/StatefulPartitionedCallStatefulPartitionedCall2random_rotation_4/StatefulPartitionedCall:output:0random_zoom_4_47258*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *Q
fLRJ
H__inference_random_zoom_4_layer_call_and_return_conditional_losses_46995
IdentityIdentity.random_zoom_4/StatefulPartitionedCall:output:0^NoOp*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿààÂ
NoOpNoOp&^random_flip_4/StatefulPartitionedCall*^random_rotation_4/StatefulPartitionedCall&^random_zoom_4/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:ÿÿÿÿÿÿÿÿÿàà: : : 2N
%random_flip_4/StatefulPartitionedCall%random_flip_4/StatefulPartitionedCall2V
)random_rotation_4/StatefulPartitionedCall)random_rotation_4/StatefulPartitionedCall2N
%random_zoom_4/StatefulPartitionedCall%random_zoom_4/StatefulPartitionedCall:f b
1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
-
_user_specified_namerandom_flip_4_input
²

c
D__inference_dropout_8_layer_call_and_return_conditional_losses_47489

inputs
identityR
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   ?l
dropout/MulMulinputsdropout/Const:output:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@C
dropout/ShapeShapeinputs*
T0*
_output_shapes
:
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@*
dtype0[
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *ÍÌL>®
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@w
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@q
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@a
IdentityIdentitydropout/Mul_1:z:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:ÿÿÿÿÿÿÿÿÿ@:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@
 
_user_specified_nameinputs
É
G
+__inference_rescaling_9_layer_call_fn_48490

inputs
identity»
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_rescaling_9_layer_call_and_return_conditional_losses_47314j
IdentityIdentityPartitionedCall:output:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿàà:Y U
1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
 
_user_specified_nameinputs


õ
C__inference_dense_17_layer_call_and_return_conditional_losses_47413

inputs1
matmul_readvariableop_resource:	-
biasadd_readvariableop_resource:
identity¢BiasAdd/ReadVariableOp¢MatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿr
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿV
SigmoidSigmoidBiasAdd:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿZ
IdentityIdentitySigmoid:y:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿw
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
ø
b
F__inference_rescaling_9_layer_call_and_return_conditional_losses_48498

inputs
identityK
Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *;M
Cast_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *    _
mulMulinputsCast/x:output:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿààd
addAddV2mul:z:0Cast_1/x:output:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿààY
IdentityIdentityadd:z:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿàà:Y U
1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
 
_user_specified_nameinputs
È
`
D__inference_flatten_8_layer_call_and_return_conditional_losses_48626

inputs
identityV
ConstConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ Ä  ^
ReshapeReshapeinputsConst:output:0*
T0*)
_output_shapes
:ÿÿÿÿÿÿÿÿÿZ
IdentityIdentityReshape:output:0*
T0*)
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:ÿÿÿÿÿÿÿÿÿ@:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@
 
_user_specified_nameinputs

d
H__inference_random_flip_4_layer_call_and_return_conditional_losses_48682

inputs
identityX
IdentityIdentityinputs*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿàà:Y U
1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
 
_user_specified_nameinputs
H


 __inference__wrapped_model_46856
sequential_9_inputP
6sequential_13_conv2d_24_conv2d_readvariableop_resource:E
7sequential_13_conv2d_24_biasadd_readvariableop_resource:P
6sequential_13_conv2d_25_conv2d_readvariableop_resource: E
7sequential_13_conv2d_25_biasadd_readvariableop_resource: P
6sequential_13_conv2d_26_conv2d_readvariableop_resource: @E
7sequential_13_conv2d_26_biasadd_readvariableop_resource:@J
5sequential_13_dense_16_matmul_readvariableop_resource:E
6sequential_13_dense_16_biasadd_readvariableop_resource:	H
5sequential_13_dense_17_matmul_readvariableop_resource:	D
6sequential_13_dense_17_biasadd_readvariableop_resource:
identity¢.sequential_13/conv2d_24/BiasAdd/ReadVariableOp¢-sequential_13/conv2d_24/Conv2D/ReadVariableOp¢.sequential_13/conv2d_25/BiasAdd/ReadVariableOp¢-sequential_13/conv2d_25/Conv2D/ReadVariableOp¢.sequential_13/conv2d_26/BiasAdd/ReadVariableOp¢-sequential_13/conv2d_26/Conv2D/ReadVariableOp¢-sequential_13/dense_16/BiasAdd/ReadVariableOp¢,sequential_13/dense_16/MatMul/ReadVariableOp¢-sequential_13/dense_17/BiasAdd/ReadVariableOp¢,sequential_13/dense_17/MatMul/ReadVariableOpe
 sequential_13/rescaling_9/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *;g
"sequential_13/rescaling_9/Cast_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *    
sequential_13/rescaling_9/mulMulsequential_9_input)sequential_13/rescaling_9/Cast/x:output:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà²
sequential_13/rescaling_9/addAddV2!sequential_13/rescaling_9/mul:z:0+sequential_13/rescaling_9/Cast_1/x:output:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà¬
-sequential_13/conv2d_24/Conv2D/ReadVariableOpReadVariableOp6sequential_13_conv2d_24_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0æ
sequential_13/conv2d_24/Conv2DConv2D!sequential_13/rescaling_9/add:z:05sequential_13/conv2d_24/Conv2D/ReadVariableOp:value:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà*
paddingSAME*
strides
¢
.sequential_13/conv2d_24/BiasAdd/ReadVariableOpReadVariableOp7sequential_13_conv2d_24_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0Ç
sequential_13/conv2d_24/BiasAddBiasAdd'sequential_13/conv2d_24/Conv2D:output:06sequential_13/conv2d_24/BiasAdd/ReadVariableOp:value:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
sequential_13/conv2d_24/ReluRelu(sequential_13/conv2d_24/BiasAdd:output:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿààÊ
&sequential_13/max_pooling2d_24/MaxPoolMaxPool*sequential_13/conv2d_24/Relu:activations:0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿpp*
ksize
*
paddingVALID*
strides
¬
-sequential_13/conv2d_25/Conv2D/ReadVariableOpReadVariableOp6sequential_13_conv2d_25_conv2d_readvariableop_resource*&
_output_shapes
: *
dtype0ò
sequential_13/conv2d_25/Conv2DConv2D/sequential_13/max_pooling2d_24/MaxPool:output:05sequential_13/conv2d_25/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿpp *
paddingSAME*
strides
¢
.sequential_13/conv2d_25/BiasAdd/ReadVariableOpReadVariableOp7sequential_13_conv2d_25_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0Å
sequential_13/conv2d_25/BiasAddBiasAdd'sequential_13/conv2d_25/Conv2D:output:06sequential_13/conv2d_25/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿpp 
sequential_13/conv2d_25/ReluRelu(sequential_13/conv2d_25/BiasAdd:output:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿpp Ê
&sequential_13/max_pooling2d_25/MaxPoolMaxPool*sequential_13/conv2d_25/Relu:activations:0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ88 *
ksize
*
paddingVALID*
strides
¬
-sequential_13/conv2d_26/Conv2D/ReadVariableOpReadVariableOp6sequential_13_conv2d_26_conv2d_readvariableop_resource*&
_output_shapes
: @*
dtype0ò
sequential_13/conv2d_26/Conv2DConv2D/sequential_13/max_pooling2d_25/MaxPool:output:05sequential_13/conv2d_26/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ88@*
paddingSAME*
strides
¢
.sequential_13/conv2d_26/BiasAdd/ReadVariableOpReadVariableOp7sequential_13_conv2d_26_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0Å
sequential_13/conv2d_26/BiasAddBiasAdd'sequential_13/conv2d_26/Conv2D:output:06sequential_13/conv2d_26/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ88@
sequential_13/conv2d_26/ReluRelu(sequential_13/conv2d_26/BiasAdd:output:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ88@Ê
&sequential_13/max_pooling2d_26/MaxPoolMaxPool*sequential_13/conv2d_26/Relu:activations:0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@*
ksize
*
paddingVALID*
strides

 sequential_13/dropout_8/IdentityIdentity/sequential_13/max_pooling2d_26/MaxPool:output:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@n
sequential_13/flatten_8/ConstConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ Ä  ±
sequential_13/flatten_8/ReshapeReshape)sequential_13/dropout_8/Identity:output:0&sequential_13/flatten_8/Const:output:0*
T0*)
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¥
,sequential_13/dense_16/MatMul/ReadVariableOpReadVariableOp5sequential_13_dense_16_matmul_readvariableop_resource*!
_output_shapes
:*
dtype0º
sequential_13/dense_16/MatMulMatMul(sequential_13/flatten_8/Reshape:output:04sequential_13/dense_16/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¡
-sequential_13/dense_16/BiasAdd/ReadVariableOpReadVariableOp6sequential_13_dense_16_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0¼
sequential_13/dense_16/BiasAddBiasAdd'sequential_13/dense_16/MatMul:product:05sequential_13/dense_16/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
sequential_13/dense_16/ReluRelu'sequential_13/dense_16/BiasAdd:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ£
,sequential_13/dense_17/MatMul/ReadVariableOpReadVariableOp5sequential_13_dense_17_matmul_readvariableop_resource*
_output_shapes
:	*
dtype0º
sequential_13/dense_17/MatMulMatMul)sequential_13/dense_16/Relu:activations:04sequential_13/dense_17/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 
-sequential_13/dense_17/BiasAdd/ReadVariableOpReadVariableOp6sequential_13_dense_17_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0»
sequential_13/dense_17/BiasAddBiasAdd'sequential_13/dense_17/MatMul:product:05sequential_13/dense_17/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
sequential_13/dense_17/SigmoidSigmoid'sequential_13/dense_17/BiasAdd:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿq
IdentityIdentity"sequential_13/dense_17/Sigmoid:y:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ§
NoOpNoOp/^sequential_13/conv2d_24/BiasAdd/ReadVariableOp.^sequential_13/conv2d_24/Conv2D/ReadVariableOp/^sequential_13/conv2d_25/BiasAdd/ReadVariableOp.^sequential_13/conv2d_25/Conv2D/ReadVariableOp/^sequential_13/conv2d_26/BiasAdd/ReadVariableOp.^sequential_13/conv2d_26/Conv2D/ReadVariableOp.^sequential_13/dense_16/BiasAdd/ReadVariableOp-^sequential_13/dense_16/MatMul/ReadVariableOp.^sequential_13/dense_17/BiasAdd/ReadVariableOp-^sequential_13/dense_17/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:ÿÿÿÿÿÿÿÿÿàà: : : : : : : : : : 2`
.sequential_13/conv2d_24/BiasAdd/ReadVariableOp.sequential_13/conv2d_24/BiasAdd/ReadVariableOp2^
-sequential_13/conv2d_24/Conv2D/ReadVariableOp-sequential_13/conv2d_24/Conv2D/ReadVariableOp2`
.sequential_13/conv2d_25/BiasAdd/ReadVariableOp.sequential_13/conv2d_25/BiasAdd/ReadVariableOp2^
-sequential_13/conv2d_25/Conv2D/ReadVariableOp-sequential_13/conv2d_25/Conv2D/ReadVariableOp2`
.sequential_13/conv2d_26/BiasAdd/ReadVariableOp.sequential_13/conv2d_26/BiasAdd/ReadVariableOp2^
-sequential_13/conv2d_26/Conv2D/ReadVariableOp-sequential_13/conv2d_26/Conv2D/ReadVariableOp2^
-sequential_13/dense_16/BiasAdd/ReadVariableOp-sequential_13/dense_16/BiasAdd/ReadVariableOp2\
,sequential_13/dense_16/MatMul/ReadVariableOp,sequential_13/dense_16/MatMul/ReadVariableOp2^
-sequential_13/dense_17/BiasAdd/ReadVariableOp-sequential_13/dense_17/BiasAdd/ReadVariableOp2\
,sequential_13/dense_17/MatMul/ReadVariableOp,sequential_13/dense_17/MatMul/ReadVariableOp:e a
1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
,
_user_specified_namesequential_9_input
Ë

1__inference_random_rotation_4_layer_call_fn_48752

inputs
unknown:	
identity¢StatefulPartitionedCallÛ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *U
fPRN
L__inference_random_rotation_4_layer_call_and_return_conditional_losses_47126y
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:ÿÿÿÿÿÿÿÿÿàà: 22
StatefulPartitionedCallStatefulPartitionedCall:Y U
1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
 
_user_specified_nameinputs

g
K__inference_max_pooling2d_24_layer_call_and_return_conditional_losses_48528

inputs
identity¢
MaxPoolMaxPoolinputs*J
_output_shapes8
6:4ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*
ksize
*
paddingVALID*
strides
{
IdentityIdentityMaxPool:output:0*
T0*J
_output_shapes8
6:4ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:r n
J
_output_shapes8
6:4ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs

d
H__inference_random_zoom_4_layer_call_and_return_conditional_losses_46879

inputs
identityX
IdentityIdentityinputs*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿàà:Y U
1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
 
_user_specified_nameinputs
±
E
)__inference_flatten_8_layer_call_fn_48620

inputs
identity±
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *)
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_flatten_8_layer_call_and_return_conditional_losses_47383b
IdentityIdentityPartitionedCall:output:0*
T0*)
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:ÿÿÿÿÿÿÿÿÿ@:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@
 
_user_specified_nameinputs
ø
b
F__inference_rescaling_9_layer_call_and_return_conditional_losses_47314

inputs
identityK
Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *;M
Cast_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *    _
mulMulinputsCast/x:output:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿààd
addAddV2mul:z:0Cast_1/x:output:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿààY
IdentityIdentityadd:z:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿàà:Y U
1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
 
_user_specified_nameinputs
4
­
H__inference_sequential_13_layer_call_and_return_conditional_losses_47597

inputs 
sequential_9_47558:	 
sequential_9_47560:	 
sequential_9_47562:	)
conv2d_24_47566:
conv2d_24_47568:)
conv2d_25_47572: 
conv2d_25_47574: )
conv2d_26_47578: @
conv2d_26_47580:@#
dense_16_47586:
dense_16_47588:	!
dense_17_47591:	
dense_17_47593:
identity¢!conv2d_24/StatefulPartitionedCall¢!conv2d_25/StatefulPartitionedCall¢!conv2d_26/StatefulPartitionedCall¢ dense_16/StatefulPartitionedCall¢ dense_17/StatefulPartitionedCall¢!dropout_8/StatefulPartitionedCall¢$sequential_9/StatefulPartitionedCall
$sequential_9/StatefulPartitionedCallStatefulPartitionedCallinputssequential_9_47558sequential_9_47560sequential_9_47562*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_sequential_9_layer_call_and_return_conditional_losses_47222î
rescaling_9/PartitionedCallPartitionedCall-sequential_9/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_rescaling_9_layer_call_and_return_conditional_losses_47314
!conv2d_24/StatefulPartitionedCallStatefulPartitionedCall$rescaling_9/PartitionedCall:output:0conv2d_24_47566conv2d_24_47568*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_conv2d_24_layer_call_and_return_conditional_losses_47327ó
 max_pooling2d_24/PartitionedCallPartitionedCall*conv2d_24/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿpp* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *T
fORM
K__inference_max_pooling2d_24_layer_call_and_return_conditional_losses_47271
!conv2d_25/StatefulPartitionedCallStatefulPartitionedCall)max_pooling2d_24/PartitionedCall:output:0conv2d_25_47572conv2d_25_47574*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿpp *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_conv2d_25_layer_call_and_return_conditional_losses_47345ó
 max_pooling2d_25/PartitionedCallPartitionedCall*conv2d_25/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ88 * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *T
fORM
K__inference_max_pooling2d_25_layer_call_and_return_conditional_losses_47283
!conv2d_26/StatefulPartitionedCallStatefulPartitionedCall)max_pooling2d_25/PartitionedCall:output:0conv2d_26_47578conv2d_26_47580*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ88@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_conv2d_26_layer_call_and_return_conditional_losses_47363ó
 max_pooling2d_26/PartitionedCallPartitionedCall*conv2d_26/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *T
fORM
K__inference_max_pooling2d_26_layer_call_and_return_conditional_losses_47295ô
!dropout_8/StatefulPartitionedCallStatefulPartitionedCall)max_pooling2d_26/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_dropout_8_layer_call_and_return_conditional_losses_47489ß
flatten_8/PartitionedCallPartitionedCall*dropout_8/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *)
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_flatten_8_layer_call_and_return_conditional_losses_47383
 dense_16/StatefulPartitionedCallStatefulPartitionedCall"flatten_8/PartitionedCall:output:0dense_16_47586dense_16_47588*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_dense_16_layer_call_and_return_conditional_losses_47396
 dense_17/StatefulPartitionedCallStatefulPartitionedCall)dense_16/StatefulPartitionedCall:output:0dense_17_47591dense_17_47593*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_dense_17_layer_call_and_return_conditional_losses_47413x
IdentityIdentity)dense_17/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿÃ
NoOpNoOp"^conv2d_24/StatefulPartitionedCall"^conv2d_25/StatefulPartitionedCall"^conv2d_26/StatefulPartitionedCall!^dense_16/StatefulPartitionedCall!^dense_17/StatefulPartitionedCall"^dropout_8/StatefulPartitionedCall%^sequential_9/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*J
_input_shapes9
7:ÿÿÿÿÿÿÿÿÿàà: : : : : : : : : : : : : 2F
!conv2d_24/StatefulPartitionedCall!conv2d_24/StatefulPartitionedCall2F
!conv2d_25/StatefulPartitionedCall!conv2d_25/StatefulPartitionedCall2F
!conv2d_26/StatefulPartitionedCall!conv2d_26/StatefulPartitionedCall2D
 dense_16/StatefulPartitionedCall dense_16/StatefulPartitionedCall2D
 dense_17/StatefulPartitionedCall dense_17/StatefulPartitionedCall2F
!dropout_8/StatefulPartitionedCall!dropout_8/StatefulPartitionedCall2L
$sequential_9/StatefulPartitionedCall$sequential_9/StatefulPartitionedCall:Y U
1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
 
_user_specified_nameinputs
Â
}
-__inference_random_flip_4_layer_call_fn_48678

inputs
unknown:	
identity¢StatefulPartitionedCall×
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *Q
fLRJ
H__inference_random_flip_4_layer_call_and_return_conditional_losses_47197y
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:ÿÿÿÿÿÿÿÿÿàà: 22
StatefulPartitionedCallStatefulPartitionedCall:Y U
1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
 
_user_specified_nameinputs
÷
b
D__inference_dropout_8_layer_call_and_return_conditional_losses_48603

inputs

identity_1V
IdentityIdentityinputs*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@c

Identity_1IdentityIdentity:output:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:ÿÿÿÿÿÿÿÿÿ@:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@
 
_user_specified_nameinputs
¿4
¹
H__inference_sequential_13_layer_call_and_return_conditional_losses_47735
sequential_9_input 
sequential_9_47696:	 
sequential_9_47698:	 
sequential_9_47700:	)
conv2d_24_47704:
conv2d_24_47706:)
conv2d_25_47710: 
conv2d_25_47712: )
conv2d_26_47716: @
conv2d_26_47718:@#
dense_16_47724:
dense_16_47726:	!
dense_17_47729:	
dense_17_47731:
identity¢!conv2d_24/StatefulPartitionedCall¢!conv2d_25/StatefulPartitionedCall¢!conv2d_26/StatefulPartitionedCall¢ dense_16/StatefulPartitionedCall¢ dense_17/StatefulPartitionedCall¢!dropout_8/StatefulPartitionedCall¢$sequential_9/StatefulPartitionedCall¤
$sequential_9/StatefulPartitionedCallStatefulPartitionedCallsequential_9_inputsequential_9_47696sequential_9_47698sequential_9_47700*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_sequential_9_layer_call_and_return_conditional_losses_47222î
rescaling_9/PartitionedCallPartitionedCall-sequential_9/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_rescaling_9_layer_call_and_return_conditional_losses_47314
!conv2d_24/StatefulPartitionedCallStatefulPartitionedCall$rescaling_9/PartitionedCall:output:0conv2d_24_47704conv2d_24_47706*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_conv2d_24_layer_call_and_return_conditional_losses_47327ó
 max_pooling2d_24/PartitionedCallPartitionedCall*conv2d_24/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿpp* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *T
fORM
K__inference_max_pooling2d_24_layer_call_and_return_conditional_losses_47271
!conv2d_25/StatefulPartitionedCallStatefulPartitionedCall)max_pooling2d_24/PartitionedCall:output:0conv2d_25_47710conv2d_25_47712*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿpp *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_conv2d_25_layer_call_and_return_conditional_losses_47345ó
 max_pooling2d_25/PartitionedCallPartitionedCall*conv2d_25/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ88 * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *T
fORM
K__inference_max_pooling2d_25_layer_call_and_return_conditional_losses_47283
!conv2d_26/StatefulPartitionedCallStatefulPartitionedCall)max_pooling2d_25/PartitionedCall:output:0conv2d_26_47716conv2d_26_47718*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ88@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_conv2d_26_layer_call_and_return_conditional_losses_47363ó
 max_pooling2d_26/PartitionedCallPartitionedCall*conv2d_26/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *T
fORM
K__inference_max_pooling2d_26_layer_call_and_return_conditional_losses_47295ô
!dropout_8/StatefulPartitionedCallStatefulPartitionedCall)max_pooling2d_26/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_dropout_8_layer_call_and_return_conditional_losses_47489ß
flatten_8/PartitionedCallPartitionedCall*dropout_8/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *)
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_flatten_8_layer_call_and_return_conditional_losses_47383
 dense_16/StatefulPartitionedCallStatefulPartitionedCall"flatten_8/PartitionedCall:output:0dense_16_47724dense_16_47726*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_dense_16_layer_call_and_return_conditional_losses_47396
 dense_17/StatefulPartitionedCallStatefulPartitionedCall)dense_16/StatefulPartitionedCall:output:0dense_17_47729dense_17_47731*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_dense_17_layer_call_and_return_conditional_losses_47413x
IdentityIdentity)dense_17/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿÃ
NoOpNoOp"^conv2d_24/StatefulPartitionedCall"^conv2d_25/StatefulPartitionedCall"^conv2d_26/StatefulPartitionedCall!^dense_16/StatefulPartitionedCall!^dense_17/StatefulPartitionedCall"^dropout_8/StatefulPartitionedCall%^sequential_9/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*J
_input_shapes9
7:ÿÿÿÿÿÿÿÿÿàà: : : : : : : : : : : : : 2F
!conv2d_24/StatefulPartitionedCall!conv2d_24/StatefulPartitionedCall2F
!conv2d_25/StatefulPartitionedCall!conv2d_25/StatefulPartitionedCall2F
!conv2d_26/StatefulPartitionedCall!conv2d_26/StatefulPartitionedCall2D
 dense_16/StatefulPartitionedCall dense_16/StatefulPartitionedCall2D
 dense_17/StatefulPartitionedCall dense_17/StatefulPartitionedCall2F
!dropout_8/StatefulPartitionedCall!dropout_8/StatefulPartitionedCall2L
$sequential_9/StatefulPartitionedCall$sequential_9/StatefulPartitionedCall:e a
1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
,
_user_specified_namesequential_9_input

®
,__inference_sequential_9_layer_call_fn_48211

inputs
unknown:	
	unknown_0:	
	unknown_1:	
identity¢StatefulPartitionedCallî
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_sequential_9_layer_call_and_return_conditional_losses_47222y
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:ÿÿÿÿÿÿÿÿÿàà: : : 22
StatefulPartitionedCallStatefulPartitionedCall:Y U
1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
 
_user_specified_nameinputs

d
H__inference_random_zoom_4_layer_call_and_return_conditional_losses_48890

inputs
identityX
IdentityIdentityinputs*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿàà:Y U
1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
 
_user_specified_nameinputs
÷©
Ï
!__inference__traced_restore_49292
file_prefix;
!assignvariableop_conv2d_24_kernel:/
!assignvariableop_1_conv2d_24_bias:=
#assignvariableop_2_conv2d_25_kernel: /
!assignvariableop_3_conv2d_25_bias: =
#assignvariableop_4_conv2d_26_kernel: @/
!assignvariableop_5_conv2d_26_bias:@7
"assignvariableop_6_dense_16_kernel:/
 assignvariableop_7_dense_16_bias:	5
"assignvariableop_8_dense_17_kernel:	.
 assignvariableop_9_dense_17_bias:'
assignvariableop_10_adam_iter:	 )
assignvariableop_11_adam_beta_1: )
assignvariableop_12_adam_beta_2: (
assignvariableop_13_adam_decay: 0
&assignvariableop_14_adam_learning_rate: #
assignvariableop_15_total: #
assignvariableop_16_count: %
assignvariableop_17_total_1: %
assignvariableop_18_count_1: S
Eassignvariableop_19_sequential_11_sequential_9_random_flip_4_statevar:	W
Iassignvariableop_20_sequential_11_sequential_9_random_rotation_4_statevar:	S
Eassignvariableop_21_sequential_11_sequential_9_random_zoom_4_statevar:	E
+assignvariableop_22_adam_conv2d_24_kernel_m:7
)assignvariableop_23_adam_conv2d_24_bias_m:E
+assignvariableop_24_adam_conv2d_25_kernel_m: 7
)assignvariableop_25_adam_conv2d_25_bias_m: E
+assignvariableop_26_adam_conv2d_26_kernel_m: @7
)assignvariableop_27_adam_conv2d_26_bias_m:@?
*assignvariableop_28_adam_dense_16_kernel_m:7
(assignvariableop_29_adam_dense_16_bias_m:	=
*assignvariableop_30_adam_dense_17_kernel_m:	6
(assignvariableop_31_adam_dense_17_bias_m:E
+assignvariableop_32_adam_conv2d_24_kernel_v:7
)assignvariableop_33_adam_conv2d_24_bias_v:E
+assignvariableop_34_adam_conv2d_25_kernel_v: 7
)assignvariableop_35_adam_conv2d_25_bias_v: E
+assignvariableop_36_adam_conv2d_26_kernel_v: @7
)assignvariableop_37_adam_conv2d_26_bias_v:@?
*assignvariableop_38_adam_dense_16_kernel_v:7
(assignvariableop_39_adam_dense_16_bias_v:	=
*assignvariableop_40_adam_dense_17_kernel_v:	6
(assignvariableop_41_adam_dense_17_bias_v:
identity_43¢AssignVariableOp¢AssignVariableOp_1¢AssignVariableOp_10¢AssignVariableOp_11¢AssignVariableOp_12¢AssignVariableOp_13¢AssignVariableOp_14¢AssignVariableOp_15¢AssignVariableOp_16¢AssignVariableOp_17¢AssignVariableOp_18¢AssignVariableOp_19¢AssignVariableOp_2¢AssignVariableOp_20¢AssignVariableOp_21¢AssignVariableOp_22¢AssignVariableOp_23¢AssignVariableOp_24¢AssignVariableOp_25¢AssignVariableOp_26¢AssignVariableOp_27¢AssignVariableOp_28¢AssignVariableOp_29¢AssignVariableOp_3¢AssignVariableOp_30¢AssignVariableOp_31¢AssignVariableOp_32¢AssignVariableOp_33¢AssignVariableOp_34¢AssignVariableOp_35¢AssignVariableOp_36¢AssignVariableOp_37¢AssignVariableOp_38¢AssignVariableOp_39¢AssignVariableOp_4¢AssignVariableOp_40¢AssignVariableOp_41¢AssignVariableOp_5¢AssignVariableOp_6¢AssignVariableOp_7¢AssignVariableOp_8¢AssignVariableOp_9è
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:+*
dtype0*
valueB+B6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-4/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEBRlayer-0/layer-0/_random_generator/_generator/_state_var/.ATTRIBUTES/VARIABLE_VALUEBRlayer-0/layer-1/_random_generator/_generator/_state_var/.ATTRIBUTES/VARIABLE_VALUEBRlayer-0/layer-2/_random_generator/_generator/_state_var/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPHÆ
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:+*
dtype0*i
value`B^+B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B ø
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*Â
_output_shapes¯
¬:::::::::::::::::::::::::::::::::::::::::::*9
dtypes/
-2+				[
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOpAssignVariableOp!assignvariableop_conv2d_24_kernelIdentity:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_1AssignVariableOp!assignvariableop_1_conv2d_24_biasIdentity_1:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_2AssignVariableOp#assignvariableop_2_conv2d_25_kernelIdentity_2:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_3AssignVariableOp!assignvariableop_3_conv2d_25_biasIdentity_3:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_4AssignVariableOp#assignvariableop_4_conv2d_26_kernelIdentity_4:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_5AssignVariableOp!assignvariableop_5_conv2d_26_biasIdentity_5:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_6AssignVariableOp"assignvariableop_6_dense_16_kernelIdentity_6:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_7AssignVariableOp assignvariableop_7_dense_16_biasIdentity_7:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_8AssignVariableOp"assignvariableop_8_dense_17_kernelIdentity_8:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_9AssignVariableOp assignvariableop_9_dense_17_biasIdentity_9:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0	*
_output_shapes
:
AssignVariableOp_10AssignVariableOpassignvariableop_10_adam_iterIdentity_10:output:0"/device:CPU:0*
_output_shapes
 *
dtype0	_
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_11AssignVariableOpassignvariableop_11_adam_beta_1Identity_11:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_12AssignVariableOpassignvariableop_12_adam_beta_2Identity_12:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_13IdentityRestoreV2:tensors:13"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_13AssignVariableOpassignvariableop_13_adam_decayIdentity_13:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_14IdentityRestoreV2:tensors:14"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_14AssignVariableOp&assignvariableop_14_adam_learning_rateIdentity_14:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_15IdentityRestoreV2:tensors:15"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_15AssignVariableOpassignvariableop_15_totalIdentity_15:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_16IdentityRestoreV2:tensors:16"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_16AssignVariableOpassignvariableop_16_countIdentity_16:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_17IdentityRestoreV2:tensors:17"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_17AssignVariableOpassignvariableop_17_total_1Identity_17:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_18IdentityRestoreV2:tensors:18"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_18AssignVariableOpassignvariableop_18_count_1Identity_18:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_19IdentityRestoreV2:tensors:19"/device:CPU:0*
T0	*
_output_shapes
:¶
AssignVariableOp_19AssignVariableOpEassignvariableop_19_sequential_11_sequential_9_random_flip_4_statevarIdentity_19:output:0"/device:CPU:0*
_output_shapes
 *
dtype0	_
Identity_20IdentityRestoreV2:tensors:20"/device:CPU:0*
T0	*
_output_shapes
:º
AssignVariableOp_20AssignVariableOpIassignvariableop_20_sequential_11_sequential_9_random_rotation_4_statevarIdentity_20:output:0"/device:CPU:0*
_output_shapes
 *
dtype0	_
Identity_21IdentityRestoreV2:tensors:21"/device:CPU:0*
T0	*
_output_shapes
:¶
AssignVariableOp_21AssignVariableOpEassignvariableop_21_sequential_11_sequential_9_random_zoom_4_statevarIdentity_21:output:0"/device:CPU:0*
_output_shapes
 *
dtype0	_
Identity_22IdentityRestoreV2:tensors:22"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_22AssignVariableOp+assignvariableop_22_adam_conv2d_24_kernel_mIdentity_22:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_23IdentityRestoreV2:tensors:23"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_23AssignVariableOp)assignvariableop_23_adam_conv2d_24_bias_mIdentity_23:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_24IdentityRestoreV2:tensors:24"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_24AssignVariableOp+assignvariableop_24_adam_conv2d_25_kernel_mIdentity_24:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_25IdentityRestoreV2:tensors:25"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_25AssignVariableOp)assignvariableop_25_adam_conv2d_25_bias_mIdentity_25:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_26IdentityRestoreV2:tensors:26"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_26AssignVariableOp+assignvariableop_26_adam_conv2d_26_kernel_mIdentity_26:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_27IdentityRestoreV2:tensors:27"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_27AssignVariableOp)assignvariableop_27_adam_conv2d_26_bias_mIdentity_27:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_28IdentityRestoreV2:tensors:28"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_28AssignVariableOp*assignvariableop_28_adam_dense_16_kernel_mIdentity_28:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_29IdentityRestoreV2:tensors:29"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_29AssignVariableOp(assignvariableop_29_adam_dense_16_bias_mIdentity_29:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_30IdentityRestoreV2:tensors:30"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_30AssignVariableOp*assignvariableop_30_adam_dense_17_kernel_mIdentity_30:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_31IdentityRestoreV2:tensors:31"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_31AssignVariableOp(assignvariableop_31_adam_dense_17_bias_mIdentity_31:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_32IdentityRestoreV2:tensors:32"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_32AssignVariableOp+assignvariableop_32_adam_conv2d_24_kernel_vIdentity_32:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_33IdentityRestoreV2:tensors:33"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_33AssignVariableOp)assignvariableop_33_adam_conv2d_24_bias_vIdentity_33:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_34IdentityRestoreV2:tensors:34"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_34AssignVariableOp+assignvariableop_34_adam_conv2d_25_kernel_vIdentity_34:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_35IdentityRestoreV2:tensors:35"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_35AssignVariableOp)assignvariableop_35_adam_conv2d_25_bias_vIdentity_35:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_36IdentityRestoreV2:tensors:36"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_36AssignVariableOp+assignvariableop_36_adam_conv2d_26_kernel_vIdentity_36:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_37IdentityRestoreV2:tensors:37"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_37AssignVariableOp)assignvariableop_37_adam_conv2d_26_bias_vIdentity_37:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_38IdentityRestoreV2:tensors:38"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_38AssignVariableOp*assignvariableop_38_adam_dense_16_kernel_vIdentity_38:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_39IdentityRestoreV2:tensors:39"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_39AssignVariableOp(assignvariableop_39_adam_dense_16_bias_vIdentity_39:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_40IdentityRestoreV2:tensors:40"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_40AssignVariableOp*assignvariableop_40_adam_dense_17_kernel_vIdentity_40:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_41IdentityRestoreV2:tensors:41"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_41AssignVariableOp(assignvariableop_41_adam_dense_17_bias_vIdentity_41:output:0"/device:CPU:0*
_output_shapes
 *
dtype01
NoOpNoOp"/device:CPU:0*
_output_shapes
 ë
Identity_42Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_41^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: W
Identity_43IdentityIdentity_42:output:0^NoOp_1*
T0*
_output_shapes
: Ø
NoOp_1NoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_41^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9*"
_acd_function_control_output(*
_output_shapes
 "#
identity_43Identity_43:output:0*i
_input_shapesX
V: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2$
AssignVariableOpAssignVariableOp2(
AssignVariableOp_1AssignVariableOp_12*
AssignVariableOp_10AssignVariableOp_102*
AssignVariableOp_11AssignVariableOp_112*
AssignVariableOp_12AssignVariableOp_122*
AssignVariableOp_13AssignVariableOp_132*
AssignVariableOp_14AssignVariableOp_142*
AssignVariableOp_15AssignVariableOp_152*
AssignVariableOp_16AssignVariableOp_162*
AssignVariableOp_17AssignVariableOp_172*
AssignVariableOp_18AssignVariableOp_182*
AssignVariableOp_19AssignVariableOp_192(
AssignVariableOp_2AssignVariableOp_22*
AssignVariableOp_20AssignVariableOp_202*
AssignVariableOp_21AssignVariableOp_212*
AssignVariableOp_22AssignVariableOp_222*
AssignVariableOp_23AssignVariableOp_232*
AssignVariableOp_24AssignVariableOp_242*
AssignVariableOp_25AssignVariableOp_252*
AssignVariableOp_26AssignVariableOp_262*
AssignVariableOp_27AssignVariableOp_272*
AssignVariableOp_28AssignVariableOp_282*
AssignVariableOp_29AssignVariableOp_292(
AssignVariableOp_3AssignVariableOp_32*
AssignVariableOp_30AssignVariableOp_302*
AssignVariableOp_31AssignVariableOp_312*
AssignVariableOp_32AssignVariableOp_322*
AssignVariableOp_33AssignVariableOp_332*
AssignVariableOp_34AssignVariableOp_342*
AssignVariableOp_35AssignVariableOp_352*
AssignVariableOp_36AssignVariableOp_362*
AssignVariableOp_37AssignVariableOp_372*
AssignVariableOp_38AssignVariableOp_382*
AssignVariableOp_39AssignVariableOp_392(
AssignVariableOp_4AssignVariableOp_42*
AssignVariableOp_40AssignVariableOp_402*
AssignVariableOp_41AssignVariableOp_412(
AssignVariableOp_5AssignVariableOp_52(
AssignVariableOp_6AssignVariableOp_62(
AssignVariableOp_7AssignVariableOp_72(
AssignVariableOp_8AssignVariableOp_82(
AssignVariableOp_9AssignVariableOp_9:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
Ã

(__inference_dense_17_layer_call_fn_48655

inputs
unknown:	
	unknown_0:
identity¢StatefulPartitionedCallØ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_dense_17_layer_call_and_return_conditional_losses_47413o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs

b
)__inference_dropout_8_layer_call_fn_48598

inputs
identity¢StatefulPartitionedCallÇ
StatefulPartitionedCallStatefulPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_dropout_8_layer_call_and_return_conditional_losses_47489w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:ÿÿÿÿÿÿÿÿÿ@22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@
 
_user_specified_nameinputs

p
G__inference_sequential_9_layer_call_and_return_conditional_losses_47249
random_flip_4_input
identityØ
random_flip_4/PartitionedCallPartitionedCallrandom_flip_4_input*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *Q
fLRJ
H__inference_random_flip_4_layer_call_and_return_conditional_losses_46867ó
!random_rotation_4/PartitionedCallPartitionedCall&random_flip_4/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *U
fPRN
L__inference_random_rotation_4_layer_call_and_return_conditional_losses_46873ï
random_zoom_4/PartitionedCallPartitionedCall*random_rotation_4/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *Q
fLRJ
H__inference_random_zoom_4_layer_call_and_return_conditional_losses_46879x
IdentityIdentity&random_zoom_4/PartitionedCall:output:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿàà:f b
1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
-
_user_specified_namerandom_flip_4_input
Ê

(__inference_dense_16_layer_call_fn_48635

inputs
unknown:
	unknown_0:	
identity¢StatefulPartitionedCallÙ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_dense_16_layer_call_and_return_conditional_losses_47396p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*,
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: : 22
StatefulPartitionedCallStatefulPartitionedCall:Q M
)
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs

ý
D__inference_conv2d_24_layer_call_and_return_conditional_losses_48518

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identity¢BiasAdd/ReadVariableOp¢Conv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿààZ
ReluReluBiasAdd:output:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿààk
IdentityIdentityRelu:activations:0^NoOp*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿààw
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*4
_input_shapes#
!:ÿÿÿÿÿÿÿÿÿàà: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:Y U
1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
 
_user_specified_nameinputs

d
H__inference_random_flip_4_layer_call_and_return_conditional_losses_46867

inputs
identityX
IdentityIdentityinputs*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿàà:Y U
1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
 
_user_specified_nameinputs
ï


-__inference_sequential_13_layer_call_fn_47443
sequential_9_input!
unknown:
	unknown_0:#
	unknown_1: 
	unknown_2: #
	unknown_3: @
	unknown_4:@
	unknown_5:
	unknown_6:	
	unknown_7:	
	unknown_8:
identity¢StatefulPartitionedCallÑ
StatefulPartitionedCallStatefulPartitionedCallsequential_9_inputunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*,
_read_only_resource_inputs

	
*-
config_proto

CPU

GPU 2J 8 *Q
fLRJ
H__inference_sequential_13_layer_call_and_return_conditional_losses_47420o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:ÿÿÿÿÿÿÿÿÿàà: : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:e a
1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
,
_user_specified_namesequential_9_input
¸
L
0__inference_max_pooling2d_26_layer_call_fn_48583

inputs
identityÙ
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *J
_output_shapes8
6:4ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *T
fORM
K__inference_max_pooling2d_26_layer_call_and_return_conditional_losses_47295
IdentityIdentityPartitionedCall:output:0*
T0*J
_output_shapes8
6:4ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:r n
J
_output_shapes8
6:4ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs

ý
D__inference_conv2d_26_layer_call_and_return_conditional_losses_48578

inputs8
conv2d_readvariableop_resource: @-
biasadd_readvariableop_resource:@
identity¢BiasAdd/ReadVariableOp¢Conv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
: @*
dtype0
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ88@*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ88@X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ88@i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ88@w
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:ÿÿÿÿÿÿÿÿÿ88 : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ88 
 
_user_specified_nameinputs
Ë


-__inference_sequential_13_layer_call_fn_47766

inputs!
unknown:
	unknown_0:#
	unknown_1: 
	unknown_2: #
	unknown_3: @
	unknown_4:@
	unknown_5:
	unknown_6:	
	unknown_7:	
	unknown_8:
identity¢StatefulPartitionedCallÅ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*,
_read_only_resource_inputs

	
*-
config_proto

CPU

GPU 2J 8 *Q
fLRJ
H__inference_sequential_13_layer_call_and_return_conditional_losses_47420o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:ÿÿÿÿÿÿÿÿÿàà: : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Y U
1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
 
_user_specified_nameinputs
ÝM
Ó
H__inference_random_flip_4_layer_call_and_return_conditional_losses_48740

inputs?
1stateful_uniform_full_int_rngreadandskip_resource:	
identity¢(stateful_uniform_full_int/RngReadAndSkipi
stateful_uniform_full_int/shapeConst*
_output_shapes
:*
dtype0*
valueB:i
stateful_uniform_full_int/ConstConst*
_output_shapes
:*
dtype0*
valueB: 
stateful_uniform_full_int/ProdProd(stateful_uniform_full_int/shape:output:0(stateful_uniform_full_int/Const:output:0*
T0*
_output_shapes
: b
 stateful_uniform_full_int/Cast/xConst*
_output_shapes
: *
dtype0*
value	B :
 stateful_uniform_full_int/Cast_1Cast'stateful_uniform_full_int/Prod:output:0*

DstT0*

SrcT0*
_output_shapes
: Ú
(stateful_uniform_full_int/RngReadAndSkipRngReadAndSkip1stateful_uniform_full_int_rngreadandskip_resource)stateful_uniform_full_int/Cast/x:output:0$stateful_uniform_full_int/Cast_1:y:0*
_output_shapes
:w
-stateful_uniform_full_int/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: y
/stateful_uniform_full_int/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:y
/stateful_uniform_full_int/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ù
'stateful_uniform_full_int/strided_sliceStridedSlice0stateful_uniform_full_int/RngReadAndSkip:value:06stateful_uniform_full_int/strided_slice/stack:output:08stateful_uniform_full_int/strided_slice/stack_1:output:08stateful_uniform_full_int/strided_slice/stack_2:output:0*
Index0*
T0	*
_output_shapes
:*

begin_mask
!stateful_uniform_full_int/BitcastBitcast0stateful_uniform_full_int/strided_slice:output:0*
T0	*
_output_shapes
:*

type0y
/stateful_uniform_full_int/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:{
1stateful_uniform_full_int/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:{
1stateful_uniform_full_int/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ï
)stateful_uniform_full_int/strided_slice_1StridedSlice0stateful_uniform_full_int/RngReadAndSkip:value:08stateful_uniform_full_int/strided_slice_1/stack:output:0:stateful_uniform_full_int/strided_slice_1/stack_1:output:0:stateful_uniform_full_int/strided_slice_1/stack_2:output:0*
Index0*
T0	*
_output_shapes
:
#stateful_uniform_full_int/Bitcast_1Bitcast2stateful_uniform_full_int/strided_slice_1:output:0*
T0	*
_output_shapes
:*

type0_
stateful_uniform_full_int/algConst*
_output_shapes
: *
dtype0*
value	B :
stateful_uniform_full_intStatelessRandomUniformFullIntV2(stateful_uniform_full_int/shape:output:0,stateful_uniform_full_int/Bitcast_1:output:0*stateful_uniform_full_int/Bitcast:output:0&stateful_uniform_full_int/alg:output:0*
_output_shapes
:*
dtype0	T

zeros_likeConst*
_output_shapes
:*
dtype0	*
valueB	R x
stackPack"stateful_uniform_full_int:output:0zeros_like:output:0*
N*
T0	*
_output_shapes

:d
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB"        f
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       f
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ÷
strided_sliceStridedSlicestack:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0	*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask
3stateless_random_flip_left_right/control_dependencyIdentityinputs*
T0*
_class
loc:@inputs*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
&stateless_random_flip_left_right/ShapeShape<stateless_random_flip_left_right/control_dependency:output:0*
T0*
_output_shapes
:~
4stateless_random_flip_left_right/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 
6stateless_random_flip_left_right/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
6stateless_random_flip_left_right/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ö
.stateless_random_flip_left_right/strided_sliceStridedSlice/stateless_random_flip_left_right/Shape:output:0=stateless_random_flip_left_right/strided_slice/stack:output:0?stateless_random_flip_left_right/strided_slice/stack_1:output:0?stateless_random_flip_left_right/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask®
?stateless_random_flip_left_right/stateless_random_uniform/shapePack7stateless_random_flip_left_right/strided_slice:output:0*
N*
T0*
_output_shapes
:
=stateless_random_flip_left_right/stateless_random_uniform/minConst*
_output_shapes
: *
dtype0*
valueB
 *    
=stateless_random_flip_left_right/stateless_random_uniform/maxConst*
_output_shapes
: *
dtype0*
valueB
 *  ?°
Vstateless_random_flip_left_right/stateless_random_uniform/StatelessRandomGetKeyCounterStatelessRandomGetKeyCounterstrided_slice:output:0* 
_output_shapes
::
Vstateless_random_flip_left_right/stateless_random_uniform/StatelessRandomUniformV2/algConst*
_output_shapes
: *
dtype0*
value	B :þ
Rstateless_random_flip_left_right/stateless_random_uniform/StatelessRandomUniformV2StatelessRandomUniformV2Hstateless_random_flip_left_right/stateless_random_uniform/shape:output:0\stateless_random_flip_left_right/stateless_random_uniform/StatelessRandomGetKeyCounter:key:0`stateless_random_flip_left_right/stateless_random_uniform/StatelessRandomGetKeyCounter:counter:0_stateless_random_flip_left_right/stateless_random_uniform/StatelessRandomUniformV2/alg:output:0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿõ
=stateless_random_flip_left_right/stateless_random_uniform/subSubFstateless_random_flip_left_right/stateless_random_uniform/max:output:0Fstateless_random_flip_left_right/stateless_random_uniform/min:output:0*
T0*
_output_shapes
: 
=stateless_random_flip_left_right/stateless_random_uniform/mulMul[stateless_random_flip_left_right/stateless_random_uniform/StatelessRandomUniformV2:output:0Astateless_random_flip_left_right/stateless_random_uniform/sub:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿû
9stateless_random_flip_left_right/stateless_random_uniformAddV2Astateless_random_flip_left_right/stateless_random_uniform/mul:z:0Fstateless_random_flip_left_right/stateless_random_uniform/min:output:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿr
0stateless_random_flip_left_right/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :r
0stateless_random_flip_left_right/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :r
0stateless_random_flip_left_right/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :Î
.stateless_random_flip_left_right/Reshape/shapePack7stateless_random_flip_left_right/strided_slice:output:09stateless_random_flip_left_right/Reshape/shape/1:output:09stateless_random_flip_left_right/Reshape/shape/2:output:09stateless_random_flip_left_right/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:å
(stateless_random_flip_left_right/ReshapeReshape=stateless_random_flip_left_right/stateless_random_uniform:z:07stateless_random_flip_left_right/Reshape/shape:output:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
&stateless_random_flip_left_right/RoundRound1stateless_random_flip_left_right/Reshape:output:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿy
/stateless_random_flip_left_right/ReverseV2/axisConst*
_output_shapes
:*
dtype0*
valueB:ë
*stateless_random_flip_left_right/ReverseV2	ReverseV2<stateless_random_flip_left_right/control_dependency:output:08stateless_random_flip_left_right/ReverseV2/axis:output:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿààÈ
$stateless_random_flip_left_right/mulMul*stateless_random_flip_left_right/Round:y:03stateless_random_flip_left_right/ReverseV2:output:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿààk
&stateless_random_flip_left_right/sub/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Â
$stateless_random_flip_left_right/subSub/stateless_random_flip_left_right/sub/x:output:0*stateless_random_flip_left_right/Round:y:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿÑ
&stateless_random_flip_left_right/mul_1Mul(stateless_random_flip_left_right/sub:z:0<stateless_random_flip_left_right/control_dependency:output:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà¿
$stateless_random_flip_left_right/addAddV2(stateless_random_flip_left_right/mul:z:0*stateless_random_flip_left_right/mul_1:z:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
IdentityIdentity(stateless_random_flip_left_right/add:z:0^NoOp*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿààq
NoOpNoOp)^stateful_uniform_full_int/RngReadAndSkip*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:ÿÿÿÿÿÿÿÿÿàà: 2T
(stateful_uniform_full_int/RngReadAndSkip(stateful_uniform_full_int/RngReadAndSkip:Y U
1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
 
_user_specified_nameinputs
Í
I
-__inference_random_zoom_4_layer_call_fn_48879

inputs
identity½
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *Q
fLRJ
H__inference_random_zoom_4_layer_call_and_return_conditional_losses_46879j
IdentityIdentityPartitionedCall:output:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿàà:Y U
1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
 
_user_specified_nameinputs

ý
D__inference_conv2d_24_layer_call_and_return_conditional_losses_47327

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identity¢BiasAdd/ReadVariableOp¢Conv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿààZ
ReluReluBiasAdd:output:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿààk
IdentityIdentityRelu:activations:0^NoOp*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿààw
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*4
_input_shapes#
!:ÿÿÿÿÿÿÿÿÿàà: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:Y U
1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
 
_user_specified_nameinputs
È
`
D__inference_flatten_8_layer_call_and_return_conditional_losses_47383

inputs
identityV
ConstConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ Ä  ^
ReshapeReshapeinputsConst:output:0*
T0*)
_output_shapes
:ÿÿÿÿÿÿÿÿÿZ
IdentityIdentityReshape:output:0*
T0*)
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:ÿÿÿÿÿÿÿÿÿ@:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@
 
_user_specified_nameinputs
è
è
-__inference_sequential_13_layer_call_fn_47657
sequential_9_input
unknown:	
	unknown_0:	
	unknown_1:	#
	unknown_2:
	unknown_3:#
	unknown_4: 
	unknown_5: #
	unknown_6: @
	unknown_7:@
	unknown_8:
	unknown_9:	

unknown_10:	

unknown_11:
identity¢StatefulPartitionedCall÷
StatefulPartitionedCallStatefulPartitionedCallsequential_9_inputunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*,
_read_only_resource_inputs

	
*-
config_proto

CPU

GPU 2J 8 *Q
fLRJ
H__inference_sequential_13_layer_call_and_return_conditional_losses_47597o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*J
_input_shapes9
7:ÿÿÿÿÿÿÿÿÿàà: : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:e a
1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
,
_user_specified_namesequential_9_input

ý
D__inference_conv2d_25_layer_call_and_return_conditional_losses_48548

inputs8
conv2d_readvariableop_resource: -
biasadd_readvariableop_resource: 
identity¢BiasAdd/ReadVariableOp¢Conv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
: *
dtype0
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿpp *
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿpp X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿpp i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿpp w
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:ÿÿÿÿÿÿÿÿÿpp: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿpp
 
_user_specified_nameinputs

ý
D__inference_conv2d_26_layer_call_and_return_conditional_losses_47363

inputs8
conv2d_readvariableop_resource: @-
biasadd_readvariableop_resource:@
identity¢BiasAdd/ReadVariableOp¢Conv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
: @*
dtype0
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ88@*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ88@X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ88@i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ88@w
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:ÿÿÿÿÿÿÿÿÿ88 : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ88 
 
_user_specified_nameinputs

g
K__inference_max_pooling2d_26_layer_call_and_return_conditional_losses_47295

inputs
identity¢
MaxPoolMaxPoolinputs*J
_output_shapes8
6:4ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*
ksize
*
paddingVALID*
strides
{
IdentityIdentityMaxPool:output:0*
T0*J
_output_shapes8
6:4ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:r n
J
_output_shapes8
6:4ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
±
Ï
G__inference_sequential_9_layer_call_and_return_conditional_losses_47222

inputs!
random_flip_4_47212:	%
random_rotation_4_47215:	!
random_zoom_4_47218:	
identity¢%random_flip_4/StatefulPartitionedCall¢)random_rotation_4/StatefulPartitionedCall¢%random_zoom_4/StatefulPartitionedCallñ
%random_flip_4/StatefulPartitionedCallStatefulPartitionedCallinputsrandom_flip_4_47212*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *Q
fLRJ
H__inference_random_flip_4_layer_call_and_return_conditional_losses_47197¥
)random_rotation_4/StatefulPartitionedCallStatefulPartitionedCall.random_flip_4/StatefulPartitionedCall:output:0random_rotation_4_47215*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *U
fPRN
L__inference_random_rotation_4_layer_call_and_return_conditional_losses_47126
%random_zoom_4/StatefulPartitionedCallStatefulPartitionedCall2random_rotation_4/StatefulPartitionedCall:output:0random_zoom_4_47218*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *Q
fLRJ
H__inference_random_zoom_4_layer_call_and_return_conditional_losses_46995
IdentityIdentity.random_zoom_4/StatefulPartitionedCall:output:0^NoOp*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿààÂ
NoOpNoOp&^random_flip_4/StatefulPartitionedCall*^random_rotation_4/StatefulPartitionedCall&^random_zoom_4/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:ÿÿÿÿÿÿÿÿÿàà: : : 2N
%random_flip_4/StatefulPartitionedCall%random_flip_4/StatefulPartitionedCall2V
)random_rotation_4/StatefulPartitionedCall)random_rotation_4/StatefulPartitionedCall2N
%random_zoom_4/StatefulPartitionedCall%random_zoom_4/StatefulPartitionedCall:Y U
1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
 
_user_specified_nameinputs
¶
»
,__inference_sequential_9_layer_call_fn_47242
random_flip_4_input
unknown:	
	unknown_0:	
	unknown_1:	
identity¢StatefulPartitionedCallû
StatefulPartitionedCallStatefulPartitionedCallrandom_flip_4_inputunknown	unknown_0	unknown_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_sequential_9_layer_call_and_return_conditional_losses_47222y
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:ÿÿÿÿÿÿÿÿÿàà: : : 22
StatefulPartitionedCallStatefulPartitionedCall:f b
1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
-
_user_specified_namerandom_flip_4_input
Õ
M
1__inference_random_rotation_4_layer_call_fn_48745

inputs
identityÁ
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *U
fPRN
L__inference_random_rotation_4_layer_call_and_return_conditional_losses_46873j
IdentityIdentityPartitionedCall:output:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿàà:Y U
1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
 
_user_specified_nameinputs
÷
b
D__inference_dropout_8_layer_call_and_return_conditional_losses_47375

inputs

identity_1V
IdentityIdentityinputs*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@c

Identity_1IdentityIdentity:output:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:ÿÿÿÿÿÿÿÿÿ@:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@
 
_user_specified_nameinputs
øý
â
G__inference_sequential_9_layer_call_and_return_conditional_losses_48485

inputsM
?random_flip_4_stateful_uniform_full_int_rngreadandskip_resource:	H
:random_rotation_4_stateful_uniform_rngreadandskip_resource:	D
6random_zoom_4_stateful_uniform_rngreadandskip_resource:	
identity¢6random_flip_4/stateful_uniform_full_int/RngReadAndSkip¢1random_rotation_4/stateful_uniform/RngReadAndSkip¢-random_zoom_4/stateful_uniform/RngReadAndSkipw
-random_flip_4/stateful_uniform_full_int/shapeConst*
_output_shapes
:*
dtype0*
valueB:w
-random_flip_4/stateful_uniform_full_int/ConstConst*
_output_shapes
:*
dtype0*
valueB: Å
,random_flip_4/stateful_uniform_full_int/ProdProd6random_flip_4/stateful_uniform_full_int/shape:output:06random_flip_4/stateful_uniform_full_int/Const:output:0*
T0*
_output_shapes
: p
.random_flip_4/stateful_uniform_full_int/Cast/xConst*
_output_shapes
: *
dtype0*
value	B :
.random_flip_4/stateful_uniform_full_int/Cast_1Cast5random_flip_4/stateful_uniform_full_int/Prod:output:0*

DstT0*

SrcT0*
_output_shapes
: 
6random_flip_4/stateful_uniform_full_int/RngReadAndSkipRngReadAndSkip?random_flip_4_stateful_uniform_full_int_rngreadandskip_resource7random_flip_4/stateful_uniform_full_int/Cast/x:output:02random_flip_4/stateful_uniform_full_int/Cast_1:y:0*
_output_shapes
:
;random_flip_4/stateful_uniform_full_int/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 
=random_flip_4/stateful_uniform_full_int/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
=random_flip_4/stateful_uniform_full_int/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
5random_flip_4/stateful_uniform_full_int/strided_sliceStridedSlice>random_flip_4/stateful_uniform_full_int/RngReadAndSkip:value:0Drandom_flip_4/stateful_uniform_full_int/strided_slice/stack:output:0Frandom_flip_4/stateful_uniform_full_int/strided_slice/stack_1:output:0Frandom_flip_4/stateful_uniform_full_int/strided_slice/stack_2:output:0*
Index0*
T0	*
_output_shapes
:*

begin_mask«
/random_flip_4/stateful_uniform_full_int/BitcastBitcast>random_flip_4/stateful_uniform_full_int/strided_slice:output:0*
T0	*
_output_shapes
:*

type0
=random_flip_4/stateful_uniform_full_int/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:
?random_flip_4/stateful_uniform_full_int/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
?random_flip_4/stateful_uniform_full_int/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
7random_flip_4/stateful_uniform_full_int/strided_slice_1StridedSlice>random_flip_4/stateful_uniform_full_int/RngReadAndSkip:value:0Frandom_flip_4/stateful_uniform_full_int/strided_slice_1/stack:output:0Hrandom_flip_4/stateful_uniform_full_int/strided_slice_1/stack_1:output:0Hrandom_flip_4/stateful_uniform_full_int/strided_slice_1/stack_2:output:0*
Index0*
T0	*
_output_shapes
:¯
1random_flip_4/stateful_uniform_full_int/Bitcast_1Bitcast@random_flip_4/stateful_uniform_full_int/strided_slice_1:output:0*
T0	*
_output_shapes
:*

type0m
+random_flip_4/stateful_uniform_full_int/algConst*
_output_shapes
: *
dtype0*
value	B :×
'random_flip_4/stateful_uniform_full_intStatelessRandomUniformFullIntV26random_flip_4/stateful_uniform_full_int/shape:output:0:random_flip_4/stateful_uniform_full_int/Bitcast_1:output:08random_flip_4/stateful_uniform_full_int/Bitcast:output:04random_flip_4/stateful_uniform_full_int/alg:output:0*
_output_shapes
:*
dtype0	b
random_flip_4/zeros_likeConst*
_output_shapes
:*
dtype0	*
valueB	R ¢
random_flip_4/stackPack0random_flip_4/stateful_uniform_full_int:output:0!random_flip_4/zeros_like:output:0*
N*
T0	*
_output_shapes

:r
!random_flip_4/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB"        t
#random_flip_4/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       t
#random_flip_4/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ½
random_flip_4/strided_sliceStridedSlicerandom_flip_4/stack:output:0*random_flip_4/strided_slice/stack:output:0,random_flip_4/strided_slice/stack_1:output:0,random_flip_4/strided_slice/stack_2:output:0*
Index0*
T0	*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask¬
Arandom_flip_4/stateless_random_flip_left_right/control_dependencyIdentityinputs*
T0*
_class
loc:@inputs*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà®
4random_flip_4/stateless_random_flip_left_right/ShapeShapeJrandom_flip_4/stateless_random_flip_left_right/control_dependency:output:0*
T0*
_output_shapes
:
Brandom_flip_4/stateless_random_flip_left_right/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 
Drandom_flip_4/stateless_random_flip_left_right/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
Drandom_flip_4/stateless_random_flip_left_right/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:¼
<random_flip_4/stateless_random_flip_left_right/strided_sliceStridedSlice=random_flip_4/stateless_random_flip_left_right/Shape:output:0Krandom_flip_4/stateless_random_flip_left_right/strided_slice/stack:output:0Mrandom_flip_4/stateless_random_flip_left_right/strided_slice/stack_1:output:0Mrandom_flip_4/stateless_random_flip_left_right/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskÊ
Mrandom_flip_4/stateless_random_flip_left_right/stateless_random_uniform/shapePackErandom_flip_4/stateless_random_flip_left_right/strided_slice:output:0*
N*
T0*
_output_shapes
:
Krandom_flip_4/stateless_random_flip_left_right/stateless_random_uniform/minConst*
_output_shapes
: *
dtype0*
valueB
 *    
Krandom_flip_4/stateless_random_flip_left_right/stateless_random_uniform/maxConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Ì
drandom_flip_4/stateless_random_flip_left_right/stateless_random_uniform/StatelessRandomGetKeyCounterStatelessRandomGetKeyCounter$random_flip_4/strided_slice:output:0* 
_output_shapes
::¦
drandom_flip_4/stateless_random_flip_left_right/stateless_random_uniform/StatelessRandomUniformV2/algConst*
_output_shapes
: *
dtype0*
value	B :Ä
`random_flip_4/stateless_random_flip_left_right/stateless_random_uniform/StatelessRandomUniformV2StatelessRandomUniformV2Vrandom_flip_4/stateless_random_flip_left_right/stateless_random_uniform/shape:output:0jrandom_flip_4/stateless_random_flip_left_right/stateless_random_uniform/StatelessRandomGetKeyCounter:key:0nrandom_flip_4/stateless_random_flip_left_right/stateless_random_uniform/StatelessRandomGetKeyCounter:counter:0mrandom_flip_4/stateless_random_flip_left_right/stateless_random_uniform/StatelessRandomUniformV2/alg:output:0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
Krandom_flip_4/stateless_random_flip_left_right/stateless_random_uniform/subSubTrandom_flip_4/stateless_random_flip_left_right/stateless_random_uniform/max:output:0Trandom_flip_4/stateless_random_flip_left_right/stateless_random_uniform/min:output:0*
T0*
_output_shapes
: ¼
Krandom_flip_4/stateless_random_flip_left_right/stateless_random_uniform/mulMulirandom_flip_4/stateless_random_flip_left_right/stateless_random_uniform/StatelessRandomUniformV2:output:0Orandom_flip_4/stateless_random_flip_left_right/stateless_random_uniform/sub:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¥
Grandom_flip_4/stateless_random_flip_left_right/stateless_random_uniformAddV2Orandom_flip_4/stateless_random_flip_left_right/stateless_random_uniform/mul:z:0Trandom_flip_4/stateless_random_flip_left_right/stateless_random_uniform/min:output:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
>random_flip_4/stateless_random_flip_left_right/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :
>random_flip_4/stateless_random_flip_left_right/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :
>random_flip_4/stateless_random_flip_left_right/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :
<random_flip_4/stateless_random_flip_left_right/Reshape/shapePackErandom_flip_4/stateless_random_flip_left_right/strided_slice:output:0Grandom_flip_4/stateless_random_flip_left_right/Reshape/shape/1:output:0Grandom_flip_4/stateless_random_flip_left_right/Reshape/shape/2:output:0Grandom_flip_4/stateless_random_flip_left_right/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:
6random_flip_4/stateless_random_flip_left_right/ReshapeReshapeKrandom_flip_4/stateless_random_flip_left_right/stateless_random_uniform:z:0Erandom_flip_4/stateless_random_flip_left_right/Reshape/shape:output:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¸
4random_flip_4/stateless_random_flip_left_right/RoundRound?random_flip_4/stateless_random_flip_left_right/Reshape:output:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
=random_flip_4/stateless_random_flip_left_right/ReverseV2/axisConst*
_output_shapes
:*
dtype0*
valueB:
8random_flip_4/stateless_random_flip_left_right/ReverseV2	ReverseV2Jrandom_flip_4/stateless_random_flip_left_right/control_dependency:output:0Frandom_flip_4/stateless_random_flip_left_right/ReverseV2/axis:output:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿààò
2random_flip_4/stateless_random_flip_left_right/mulMul8random_flip_4/stateless_random_flip_left_right/Round:y:0Arandom_flip_4/stateless_random_flip_left_right/ReverseV2:output:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàày
4random_flip_4/stateless_random_flip_left_right/sub/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?ì
2random_flip_4/stateless_random_flip_left_right/subSub=random_flip_4/stateless_random_flip_left_right/sub/x:output:08random_flip_4/stateless_random_flip_left_right/Round:y:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿû
4random_flip_4/stateless_random_flip_left_right/mul_1Mul6random_flip_4/stateless_random_flip_left_right/sub:z:0Jrandom_flip_4/stateless_random_flip_left_right/control_dependency:output:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿààé
2random_flip_4/stateless_random_flip_left_right/addAddV26random_flip_4/stateless_random_flip_left_right/mul:z:08random_flip_4/stateless_random_flip_left_right/mul_1:z:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà}
random_rotation_4/ShapeShape6random_flip_4/stateless_random_flip_left_right/add:z:0*
T0*
_output_shapes
:o
%random_rotation_4/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: q
'random_rotation_4/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:q
'random_rotation_4/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:«
random_rotation_4/strided_sliceStridedSlice random_rotation_4/Shape:output:0.random_rotation_4/strided_slice/stack:output:00random_rotation_4/strided_slice/stack_1:output:00random_rotation_4/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskz
'random_rotation_4/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:
ýÿÿÿÿÿÿÿÿ|
)random_rotation_4/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
þÿÿÿÿÿÿÿÿs
)random_rotation_4/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:³
!random_rotation_4/strided_slice_1StridedSlice random_rotation_4/Shape:output:00random_rotation_4/strided_slice_1/stack:output:02random_rotation_4/strided_slice_1/stack_1:output:02random_rotation_4/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskz
random_rotation_4/CastCast*random_rotation_4/strided_slice_1:output:0*

DstT0*

SrcT0*
_output_shapes
: z
'random_rotation_4/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:
þÿÿÿÿÿÿÿÿ|
)random_rotation_4/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿs
)random_rotation_4/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:³
!random_rotation_4/strided_slice_2StridedSlice random_rotation_4/Shape:output:00random_rotation_4/strided_slice_2/stack:output:02random_rotation_4/strided_slice_2/stack_1:output:02random_rotation_4/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask|
random_rotation_4/Cast_1Cast*random_rotation_4/strided_slice_2:output:0*

DstT0*

SrcT0*
_output_shapes
: 
(random_rotation_4/stateful_uniform/shapePack(random_rotation_4/strided_slice:output:0*
N*
T0*
_output_shapes
:k
&random_rotation_4/stateful_uniform/minConst*
_output_shapes
: *
dtype0*
valueB
 *|Ù ¿k
&random_rotation_4/stateful_uniform/maxConst*
_output_shapes
: *
dtype0*
valueB
 *|Ù ?r
(random_rotation_4/stateful_uniform/ConstConst*
_output_shapes
:*
dtype0*
valueB: ¶
'random_rotation_4/stateful_uniform/ProdProd1random_rotation_4/stateful_uniform/shape:output:01random_rotation_4/stateful_uniform/Const:output:0*
T0*
_output_shapes
: k
)random_rotation_4/stateful_uniform/Cast/xConst*
_output_shapes
: *
dtype0*
value	B :
)random_rotation_4/stateful_uniform/Cast_1Cast0random_rotation_4/stateful_uniform/Prod:output:0*

DstT0*

SrcT0*
_output_shapes
: þ
1random_rotation_4/stateful_uniform/RngReadAndSkipRngReadAndSkip:random_rotation_4_stateful_uniform_rngreadandskip_resource2random_rotation_4/stateful_uniform/Cast/x:output:0-random_rotation_4/stateful_uniform/Cast_1:y:0*
_output_shapes
:
6random_rotation_4/stateful_uniform/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 
8random_rotation_4/stateful_uniform/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
8random_rotation_4/stateful_uniform/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
0random_rotation_4/stateful_uniform/strided_sliceStridedSlice9random_rotation_4/stateful_uniform/RngReadAndSkip:value:0?random_rotation_4/stateful_uniform/strided_slice/stack:output:0Arandom_rotation_4/stateful_uniform/strided_slice/stack_1:output:0Arandom_rotation_4/stateful_uniform/strided_slice/stack_2:output:0*
Index0*
T0	*
_output_shapes
:*

begin_mask¡
*random_rotation_4/stateful_uniform/BitcastBitcast9random_rotation_4/stateful_uniform/strided_slice:output:0*
T0	*
_output_shapes
:*

type0
8random_rotation_4/stateful_uniform/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:
:random_rotation_4/stateful_uniform/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
:random_rotation_4/stateful_uniform/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ü
2random_rotation_4/stateful_uniform/strided_slice_1StridedSlice9random_rotation_4/stateful_uniform/RngReadAndSkip:value:0Arandom_rotation_4/stateful_uniform/strided_slice_1/stack:output:0Crandom_rotation_4/stateful_uniform/strided_slice_1/stack_1:output:0Crandom_rotation_4/stateful_uniform/strided_slice_1/stack_2:output:0*
Index0*
T0	*
_output_shapes
:¥
,random_rotation_4/stateful_uniform/Bitcast_1Bitcast;random_rotation_4/stateful_uniform/strided_slice_1:output:0*
T0	*
_output_shapes
:*

type0
?random_rotation_4/stateful_uniform/StatelessRandomUniformV2/algConst*
_output_shapes
: *
dtype0*
value	B :å
;random_rotation_4/stateful_uniform/StatelessRandomUniformV2StatelessRandomUniformV21random_rotation_4/stateful_uniform/shape:output:05random_rotation_4/stateful_uniform/Bitcast_1:output:03random_rotation_4/stateful_uniform/Bitcast:output:0Hrandom_rotation_4/stateful_uniform/StatelessRandomUniformV2/alg:output:0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ°
&random_rotation_4/stateful_uniform/subSub/random_rotation_4/stateful_uniform/max:output:0/random_rotation_4/stateful_uniform/min:output:0*
T0*
_output_shapes
: Í
&random_rotation_4/stateful_uniform/mulMulDrandom_rotation_4/stateful_uniform/StatelessRandomUniformV2:output:0*random_rotation_4/stateful_uniform/sub:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¶
"random_rotation_4/stateful_uniformAddV2*random_rotation_4/stateful_uniform/mul:z:0/random_rotation_4/stateful_uniform/min:output:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿl
'random_rotation_4/rotation_matrix/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
%random_rotation_4/rotation_matrix/subSubrandom_rotation_4/Cast_1:y:00random_rotation_4/rotation_matrix/sub/y:output:0*
T0*
_output_shapes
: 
%random_rotation_4/rotation_matrix/CosCos&random_rotation_4/stateful_uniform:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿn
)random_rotation_4/rotation_matrix/sub_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?¡
'random_rotation_4/rotation_matrix/sub_1Subrandom_rotation_4/Cast_1:y:02random_rotation_4/rotation_matrix/sub_1/y:output:0*
T0*
_output_shapes
: ²
%random_rotation_4/rotation_matrix/mulMul)random_rotation_4/rotation_matrix/Cos:y:0+random_rotation_4/rotation_matrix/sub_1:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
%random_rotation_4/rotation_matrix/SinSin&random_rotation_4/stateful_uniform:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿn
)random_rotation_4/rotation_matrix/sub_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
'random_rotation_4/rotation_matrix/sub_2Subrandom_rotation_4/Cast:y:02random_rotation_4/rotation_matrix/sub_2/y:output:0*
T0*
_output_shapes
: ´
'random_rotation_4/rotation_matrix/mul_1Mul)random_rotation_4/rotation_matrix/Sin:y:0+random_rotation_4/rotation_matrix/sub_2:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ´
'random_rotation_4/rotation_matrix/sub_3Sub)random_rotation_4/rotation_matrix/mul:z:0+random_rotation_4/rotation_matrix/mul_1:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ´
'random_rotation_4/rotation_matrix/sub_4Sub)random_rotation_4/rotation_matrix/sub:z:0+random_rotation_4/rotation_matrix/sub_3:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿp
+random_rotation_4/rotation_matrix/truediv/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @Å
)random_rotation_4/rotation_matrix/truedivRealDiv+random_rotation_4/rotation_matrix/sub_4:z:04random_rotation_4/rotation_matrix/truediv/y:output:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿn
)random_rotation_4/rotation_matrix/sub_5/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
'random_rotation_4/rotation_matrix/sub_5Subrandom_rotation_4/Cast:y:02random_rotation_4/rotation_matrix/sub_5/y:output:0*
T0*
_output_shapes
: 
'random_rotation_4/rotation_matrix/Sin_1Sin&random_rotation_4/stateful_uniform:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿn
)random_rotation_4/rotation_matrix/sub_6/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?¡
'random_rotation_4/rotation_matrix/sub_6Subrandom_rotation_4/Cast_1:y:02random_rotation_4/rotation_matrix/sub_6/y:output:0*
T0*
_output_shapes
: ¶
'random_rotation_4/rotation_matrix/mul_2Mul+random_rotation_4/rotation_matrix/Sin_1:y:0+random_rotation_4/rotation_matrix/sub_6:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
'random_rotation_4/rotation_matrix/Cos_1Cos&random_rotation_4/stateful_uniform:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿn
)random_rotation_4/rotation_matrix/sub_7/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
'random_rotation_4/rotation_matrix/sub_7Subrandom_rotation_4/Cast:y:02random_rotation_4/rotation_matrix/sub_7/y:output:0*
T0*
_output_shapes
: ¶
'random_rotation_4/rotation_matrix/mul_3Mul+random_rotation_4/rotation_matrix/Cos_1:y:0+random_rotation_4/rotation_matrix/sub_7:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¶
%random_rotation_4/rotation_matrix/addAddV2+random_rotation_4/rotation_matrix/mul_2:z:0+random_rotation_4/rotation_matrix/mul_3:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ´
'random_rotation_4/rotation_matrix/sub_8Sub+random_rotation_4/rotation_matrix/sub_5:z:0)random_rotation_4/rotation_matrix/add:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿr
-random_rotation_4/rotation_matrix/truediv_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @É
+random_rotation_4/rotation_matrix/truediv_1RealDiv+random_rotation_4/rotation_matrix/sub_8:z:06random_rotation_4/rotation_matrix/truediv_1/y:output:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ}
'random_rotation_4/rotation_matrix/ShapeShape&random_rotation_4/stateful_uniform:z:0*
T0*
_output_shapes
:
5random_rotation_4/rotation_matrix/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 
7random_rotation_4/rotation_matrix/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
7random_rotation_4/rotation_matrix/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:û
/random_rotation_4/rotation_matrix/strided_sliceStridedSlice0random_rotation_4/rotation_matrix/Shape:output:0>random_rotation_4/rotation_matrix/strided_slice/stack:output:0@random_rotation_4/rotation_matrix/strided_slice/stack_1:output:0@random_rotation_4/rotation_matrix/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
'random_rotation_4/rotation_matrix/Cos_2Cos&random_rotation_4/stateful_uniform:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
7random_rotation_4/rotation_matrix/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"        
9random_rotation_4/rotation_matrix/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"        
9random_rotation_4/rotation_matrix/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ®
1random_rotation_4/rotation_matrix/strided_slice_1StridedSlice+random_rotation_4/rotation_matrix/Cos_2:y:0@random_rotation_4/rotation_matrix/strided_slice_1/stack:output:0Brandom_rotation_4/rotation_matrix/strided_slice_1/stack_1:output:0Brandom_rotation_4/rotation_matrix/strided_slice_1/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask*
end_mask*
new_axis_mask
'random_rotation_4/rotation_matrix/Sin_2Sin&random_rotation_4/stateful_uniform:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
7random_rotation_4/rotation_matrix/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB"        
9random_rotation_4/rotation_matrix/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB"        
9random_rotation_4/rotation_matrix/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ®
1random_rotation_4/rotation_matrix/strided_slice_2StridedSlice+random_rotation_4/rotation_matrix/Sin_2:y:0@random_rotation_4/rotation_matrix/strided_slice_2/stack:output:0Brandom_rotation_4/rotation_matrix/strided_slice_2/stack_1:output:0Brandom_rotation_4/rotation_matrix/strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask*
end_mask*
new_axis_mask
%random_rotation_4/rotation_matrix/NegNeg:random_rotation_4/rotation_matrix/strided_slice_2:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
7random_rotation_4/rotation_matrix/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB"        
9random_rotation_4/rotation_matrix/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB"        
9random_rotation_4/rotation_matrix/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      °
1random_rotation_4/rotation_matrix/strided_slice_3StridedSlice-random_rotation_4/rotation_matrix/truediv:z:0@random_rotation_4/rotation_matrix/strided_slice_3/stack:output:0Brandom_rotation_4/rotation_matrix/strided_slice_3/stack_1:output:0Brandom_rotation_4/rotation_matrix/strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask*
end_mask*
new_axis_mask
'random_rotation_4/rotation_matrix/Sin_3Sin&random_rotation_4/stateful_uniform:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
7random_rotation_4/rotation_matrix/strided_slice_4/stackConst*
_output_shapes
:*
dtype0*
valueB"        
9random_rotation_4/rotation_matrix/strided_slice_4/stack_1Const*
_output_shapes
:*
dtype0*
valueB"        
9random_rotation_4/rotation_matrix/strided_slice_4/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ®
1random_rotation_4/rotation_matrix/strided_slice_4StridedSlice+random_rotation_4/rotation_matrix/Sin_3:y:0@random_rotation_4/rotation_matrix/strided_slice_4/stack:output:0Brandom_rotation_4/rotation_matrix/strided_slice_4/stack_1:output:0Brandom_rotation_4/rotation_matrix/strided_slice_4/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask*
end_mask*
new_axis_mask
'random_rotation_4/rotation_matrix/Cos_3Cos&random_rotation_4/stateful_uniform:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
7random_rotation_4/rotation_matrix/strided_slice_5/stackConst*
_output_shapes
:*
dtype0*
valueB"        
9random_rotation_4/rotation_matrix/strided_slice_5/stack_1Const*
_output_shapes
:*
dtype0*
valueB"        
9random_rotation_4/rotation_matrix/strided_slice_5/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ®
1random_rotation_4/rotation_matrix/strided_slice_5StridedSlice+random_rotation_4/rotation_matrix/Cos_3:y:0@random_rotation_4/rotation_matrix/strided_slice_5/stack:output:0Brandom_rotation_4/rotation_matrix/strided_slice_5/stack_1:output:0Brandom_rotation_4/rotation_matrix/strided_slice_5/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask*
end_mask*
new_axis_mask
7random_rotation_4/rotation_matrix/strided_slice_6/stackConst*
_output_shapes
:*
dtype0*
valueB"        
9random_rotation_4/rotation_matrix/strided_slice_6/stack_1Const*
_output_shapes
:*
dtype0*
valueB"        
9random_rotation_4/rotation_matrix/strided_slice_6/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ²
1random_rotation_4/rotation_matrix/strided_slice_6StridedSlice/random_rotation_4/rotation_matrix/truediv_1:z:0@random_rotation_4/rotation_matrix/strided_slice_6/stack:output:0Brandom_rotation_4/rotation_matrix/strided_slice_6/stack_1:output:0Brandom_rotation_4/rotation_matrix/strided_slice_6/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask*
end_mask*
new_axis_maskr
0random_rotation_4/rotation_matrix/zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B :Ù
.random_rotation_4/rotation_matrix/zeros/packedPack8random_rotation_4/rotation_matrix/strided_slice:output:09random_rotation_4/rotation_matrix/zeros/packed/1:output:0*
N*
T0*
_output_shapes
:r
-random_rotation_4/rotation_matrix/zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    Ò
'random_rotation_4/rotation_matrix/zerosFill7random_rotation_4/rotation_matrix/zeros/packed:output:06random_rotation_4/rotation_matrix/zeros/Const:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿo
-random_rotation_4/rotation_matrix/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :°
(random_rotation_4/rotation_matrix/concatConcatV2:random_rotation_4/rotation_matrix/strided_slice_1:output:0)random_rotation_4/rotation_matrix/Neg:y:0:random_rotation_4/rotation_matrix/strided_slice_3:output:0:random_rotation_4/rotation_matrix/strided_slice_4:output:0:random_rotation_4/rotation_matrix/strided_slice_5:output:0:random_rotation_4/rotation_matrix/strided_slice_6:output:00random_rotation_4/rotation_matrix/zeros:output:06random_rotation_4/rotation_matrix/concat/axis:output:0*
N*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
!random_rotation_4/transform/ShapeShape6random_flip_4/stateless_random_flip_left_right/add:z:0*
T0*
_output_shapes
:y
/random_rotation_4/transform/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:{
1random_rotation_4/transform/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:{
1random_rotation_4/transform/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:É
)random_rotation_4/transform/strided_sliceStridedSlice*random_rotation_4/transform/Shape:output:08random_rotation_4/transform/strided_slice/stack:output:0:random_rotation_4/transform/strided_slice/stack_1:output:0:random_rotation_4/transform/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:k
&random_rotation_4/transform/fill_valueConst*
_output_shapes
: *
dtype0*
valueB
 *    
6random_rotation_4/transform/ImageProjectiveTransformV3ImageProjectiveTransformV36random_flip_4/stateless_random_flip_left_right/add:z:01random_rotation_4/rotation_matrix/concat:output:02random_rotation_4/transform/strided_slice:output:0/random_rotation_4/transform/fill_value:output:0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà*
dtype0*
	fill_mode	REFLECT*
interpolation
BILINEAR
random_zoom_4/ShapeShapeKrandom_rotation_4/transform/ImageProjectiveTransformV3:transformed_images:0*
T0*
_output_shapes
:k
!random_zoom_4/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: m
#random_zoom_4/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:m
#random_zoom_4/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
random_zoom_4/strided_sliceStridedSlicerandom_zoom_4/Shape:output:0*random_zoom_4/strided_slice/stack:output:0,random_zoom_4/strided_slice/stack_1:output:0,random_zoom_4/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskv
#random_zoom_4/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:
ýÿÿÿÿÿÿÿÿx
%random_zoom_4/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
þÿÿÿÿÿÿÿÿo
%random_zoom_4/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
random_zoom_4/strided_slice_1StridedSlicerandom_zoom_4/Shape:output:0,random_zoom_4/strided_slice_1/stack:output:0.random_zoom_4/strided_slice_1/stack_1:output:0.random_zoom_4/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskr
random_zoom_4/CastCast&random_zoom_4/strided_slice_1:output:0*

DstT0*

SrcT0*
_output_shapes
: v
#random_zoom_4/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:
þÿÿÿÿÿÿÿÿx
%random_zoom_4/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿo
%random_zoom_4/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
random_zoom_4/strided_slice_2StridedSlicerandom_zoom_4/Shape:output:0,random_zoom_4/strided_slice_2/stack:output:0.random_zoom_4/strided_slice_2/stack_1:output:0.random_zoom_4/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskt
random_zoom_4/Cast_1Cast&random_zoom_4/strided_slice_2:output:0*

DstT0*

SrcT0*
_output_shapes
: h
&random_zoom_4/stateful_uniform/shape/1Const*
_output_shapes
: *
dtype0*
value	B :±
$random_zoom_4/stateful_uniform/shapePack$random_zoom_4/strided_slice:output:0/random_zoom_4/stateful_uniform/shape/1:output:0*
N*
T0*
_output_shapes
:g
"random_zoom_4/stateful_uniform/minConst*
_output_shapes
: *
dtype0*
valueB
 *fff?g
"random_zoom_4/stateful_uniform/maxConst*
_output_shapes
: *
dtype0*
valueB
 *ÍÌ?n
$random_zoom_4/stateful_uniform/ConstConst*
_output_shapes
:*
dtype0*
valueB: ª
#random_zoom_4/stateful_uniform/ProdProd-random_zoom_4/stateful_uniform/shape:output:0-random_zoom_4/stateful_uniform/Const:output:0*
T0*
_output_shapes
: g
%random_zoom_4/stateful_uniform/Cast/xConst*
_output_shapes
: *
dtype0*
value	B :
%random_zoom_4/stateful_uniform/Cast_1Cast,random_zoom_4/stateful_uniform/Prod:output:0*

DstT0*

SrcT0*
_output_shapes
: î
-random_zoom_4/stateful_uniform/RngReadAndSkipRngReadAndSkip6random_zoom_4_stateful_uniform_rngreadandskip_resource.random_zoom_4/stateful_uniform/Cast/x:output:0)random_zoom_4/stateful_uniform/Cast_1:y:0*
_output_shapes
:|
2random_zoom_4/stateful_uniform/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: ~
4random_zoom_4/stateful_uniform/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:~
4random_zoom_4/stateful_uniform/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ò
,random_zoom_4/stateful_uniform/strided_sliceStridedSlice5random_zoom_4/stateful_uniform/RngReadAndSkip:value:0;random_zoom_4/stateful_uniform/strided_slice/stack:output:0=random_zoom_4/stateful_uniform/strided_slice/stack_1:output:0=random_zoom_4/stateful_uniform/strided_slice/stack_2:output:0*
Index0*
T0	*
_output_shapes
:*

begin_mask
&random_zoom_4/stateful_uniform/BitcastBitcast5random_zoom_4/stateful_uniform/strided_slice:output:0*
T0	*
_output_shapes
:*

type0~
4random_zoom_4/stateful_uniform/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:
6random_zoom_4/stateful_uniform/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
6random_zoom_4/stateful_uniform/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:è
.random_zoom_4/stateful_uniform/strided_slice_1StridedSlice5random_zoom_4/stateful_uniform/RngReadAndSkip:value:0=random_zoom_4/stateful_uniform/strided_slice_1/stack:output:0?random_zoom_4/stateful_uniform/strided_slice_1/stack_1:output:0?random_zoom_4/stateful_uniform/strided_slice_1/stack_2:output:0*
Index0*
T0	*
_output_shapes
:
(random_zoom_4/stateful_uniform/Bitcast_1Bitcast7random_zoom_4/stateful_uniform/strided_slice_1:output:0*
T0	*
_output_shapes
:*

type0}
;random_zoom_4/stateful_uniform/StatelessRandomUniformV2/algConst*
_output_shapes
: *
dtype0*
value	B :Õ
7random_zoom_4/stateful_uniform/StatelessRandomUniformV2StatelessRandomUniformV2-random_zoom_4/stateful_uniform/shape:output:01random_zoom_4/stateful_uniform/Bitcast_1:output:0/random_zoom_4/stateful_uniform/Bitcast:output:0Drandom_zoom_4/stateful_uniform/StatelessRandomUniformV2/alg:output:0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¤
"random_zoom_4/stateful_uniform/subSub+random_zoom_4/stateful_uniform/max:output:0+random_zoom_4/stateful_uniform/min:output:0*
T0*
_output_shapes
: Å
"random_zoom_4/stateful_uniform/mulMul@random_zoom_4/stateful_uniform/StatelessRandomUniformV2:output:0&random_zoom_4/stateful_uniform/sub:z:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ®
random_zoom_4/stateful_uniformAddV2&random_zoom_4/stateful_uniform/mul:z:0+random_zoom_4/stateful_uniform/min:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ[
random_zoom_4/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :Ç
random_zoom_4/concatConcatV2"random_zoom_4/stateful_uniform:z:0"random_zoom_4/stateful_uniform:z:0"random_zoom_4/concat/axis:output:0*
N*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿl
random_zoom_4/zoom_matrix/ShapeShaperandom_zoom_4/concat:output:0*
T0*
_output_shapes
:w
-random_zoom_4/zoom_matrix/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: y
/random_zoom_4/zoom_matrix/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:y
/random_zoom_4/zoom_matrix/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ó
'random_zoom_4/zoom_matrix/strided_sliceStridedSlice(random_zoom_4/zoom_matrix/Shape:output:06random_zoom_4/zoom_matrix/strided_slice/stack:output:08random_zoom_4/zoom_matrix/strided_slice/stack_1:output:08random_zoom_4/zoom_matrix/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskd
random_zoom_4/zoom_matrix/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
random_zoom_4/zoom_matrix/subSubrandom_zoom_4/Cast_1:y:0(random_zoom_4/zoom_matrix/sub/y:output:0*
T0*
_output_shapes
: h
#random_zoom_4/zoom_matrix/truediv/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @
!random_zoom_4/zoom_matrix/truedivRealDiv!random_zoom_4/zoom_matrix/sub:z:0,random_zoom_4/zoom_matrix/truediv/y:output:0*
T0*
_output_shapes
: 
/random_zoom_4/zoom_matrix/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*!
valueB"            
1random_zoom_4/zoom_matrix/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*!
valueB"           
1random_zoom_4/zoom_matrix/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*!
valueB"         
)random_zoom_4/zoom_matrix/strided_slice_1StridedSlicerandom_zoom_4/concat:output:08random_zoom_4/zoom_matrix/strided_slice_1/stack:output:0:random_zoom_4/zoom_matrix/strided_slice_1/stack_1:output:0:random_zoom_4/zoom_matrix/strided_slice_1/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask*
end_mask*
new_axis_mask*
shrink_axis_maskf
!random_zoom_4/zoom_matrix/sub_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?¸
random_zoom_4/zoom_matrix/sub_1Sub*random_zoom_4/zoom_matrix/sub_1/x:output:02random_zoom_4/zoom_matrix/strided_slice_1:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¢
random_zoom_4/zoom_matrix/mulMul%random_zoom_4/zoom_matrix/truediv:z:0#random_zoom_4/zoom_matrix/sub_1:z:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿf
!random_zoom_4/zoom_matrix/sub_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
random_zoom_4/zoom_matrix/sub_2Subrandom_zoom_4/Cast:y:0*random_zoom_4/zoom_matrix/sub_2/y:output:0*
T0*
_output_shapes
: j
%random_zoom_4/zoom_matrix/truediv_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @¤
#random_zoom_4/zoom_matrix/truediv_1RealDiv#random_zoom_4/zoom_matrix/sub_2:z:0.random_zoom_4/zoom_matrix/truediv_1/y:output:0*
T0*
_output_shapes
: 
/random_zoom_4/zoom_matrix/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*!
valueB"           
1random_zoom_4/zoom_matrix/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*!
valueB"           
1random_zoom_4/zoom_matrix/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*!
valueB"         
)random_zoom_4/zoom_matrix/strided_slice_2StridedSlicerandom_zoom_4/concat:output:08random_zoom_4/zoom_matrix/strided_slice_2/stack:output:0:random_zoom_4/zoom_matrix/strided_slice_2/stack_1:output:0:random_zoom_4/zoom_matrix/strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask*
end_mask*
new_axis_mask*
shrink_axis_maskf
!random_zoom_4/zoom_matrix/sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?¸
random_zoom_4/zoom_matrix/sub_3Sub*random_zoom_4/zoom_matrix/sub_3/x:output:02random_zoom_4/zoom_matrix/strided_slice_2:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¦
random_zoom_4/zoom_matrix/mul_1Mul'random_zoom_4/zoom_matrix/truediv_1:z:0#random_zoom_4/zoom_matrix/sub_3:z:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
/random_zoom_4/zoom_matrix/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*!
valueB"            
1random_zoom_4/zoom_matrix/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*!
valueB"           
1random_zoom_4/zoom_matrix/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*!
valueB"         
)random_zoom_4/zoom_matrix/strided_slice_3StridedSlicerandom_zoom_4/concat:output:08random_zoom_4/zoom_matrix/strided_slice_3/stack:output:0:random_zoom_4/zoom_matrix/strided_slice_3/stack_1:output:0:random_zoom_4/zoom_matrix/strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask*
end_mask*
new_axis_mask*
shrink_axis_maskj
(random_zoom_4/zoom_matrix/zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B :Á
&random_zoom_4/zoom_matrix/zeros/packedPack0random_zoom_4/zoom_matrix/strided_slice:output:01random_zoom_4/zoom_matrix/zeros/packed/1:output:0*
N*
T0*
_output_shapes
:j
%random_zoom_4/zoom_matrix/zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    º
random_zoom_4/zoom_matrix/zerosFill/random_zoom_4/zoom_matrix/zeros/packed:output:0.random_zoom_4/zoom_matrix/zeros/Const:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿl
*random_zoom_4/zoom_matrix/zeros_1/packed/1Const*
_output_shapes
: *
dtype0*
value	B :Å
(random_zoom_4/zoom_matrix/zeros_1/packedPack0random_zoom_4/zoom_matrix/strided_slice:output:03random_zoom_4/zoom_matrix/zeros_1/packed/1:output:0*
N*
T0*
_output_shapes
:l
'random_zoom_4/zoom_matrix/zeros_1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    À
!random_zoom_4/zoom_matrix/zeros_1Fill1random_zoom_4/zoom_matrix/zeros_1/packed:output:00random_zoom_4/zoom_matrix/zeros_1/Const:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
/random_zoom_4/zoom_matrix/strided_slice_4/stackConst*
_output_shapes
:*
dtype0*!
valueB"           
1random_zoom_4/zoom_matrix/strided_slice_4/stack_1Const*
_output_shapes
:*
dtype0*!
valueB"           
1random_zoom_4/zoom_matrix/strided_slice_4/stack_2Const*
_output_shapes
:*
dtype0*!
valueB"         
)random_zoom_4/zoom_matrix/strided_slice_4StridedSlicerandom_zoom_4/concat:output:08random_zoom_4/zoom_matrix/strided_slice_4/stack:output:0:random_zoom_4/zoom_matrix/strided_slice_4/stack_1:output:0:random_zoom_4/zoom_matrix/strided_slice_4/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask*
end_mask*
new_axis_mask*
shrink_axis_maskl
*random_zoom_4/zoom_matrix/zeros_2/packed/1Const*
_output_shapes
: *
dtype0*
value	B :Å
(random_zoom_4/zoom_matrix/zeros_2/packedPack0random_zoom_4/zoom_matrix/strided_slice:output:03random_zoom_4/zoom_matrix/zeros_2/packed/1:output:0*
N*
T0*
_output_shapes
:l
'random_zoom_4/zoom_matrix/zeros_2/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    À
!random_zoom_4/zoom_matrix/zeros_2Fill1random_zoom_4/zoom_matrix/zeros_2/packed:output:00random_zoom_4/zoom_matrix/zeros_2/Const:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿg
%random_zoom_4/zoom_matrix/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :É
 random_zoom_4/zoom_matrix/concatConcatV22random_zoom_4/zoom_matrix/strided_slice_3:output:0(random_zoom_4/zoom_matrix/zeros:output:0!random_zoom_4/zoom_matrix/mul:z:0*random_zoom_4/zoom_matrix/zeros_1:output:02random_zoom_4/zoom_matrix/strided_slice_4:output:0#random_zoom_4/zoom_matrix/mul_1:z:0*random_zoom_4/zoom_matrix/zeros_2:output:0.random_zoom_4/zoom_matrix/concat/axis:output:0*
N*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
random_zoom_4/transform/ShapeShapeKrandom_rotation_4/transform/ImageProjectiveTransformV3:transformed_images:0*
T0*
_output_shapes
:u
+random_zoom_4/transform/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:w
-random_zoom_4/transform/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:w
-random_zoom_4/transform/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:µ
%random_zoom_4/transform/strided_sliceStridedSlice&random_zoom_4/transform/Shape:output:04random_zoom_4/transform/strided_slice/stack:output:06random_zoom_4/transform/strided_slice/stack_1:output:06random_zoom_4/transform/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:g
"random_zoom_4/transform/fill_valueConst*
_output_shapes
: *
dtype0*
valueB
 *    
2random_zoom_4/transform/ImageProjectiveTransformV3ImageProjectiveTransformV3Krandom_rotation_4/transform/ImageProjectiveTransformV3:transformed_images:0)random_zoom_4/zoom_matrix/concat:output:0.random_zoom_4/transform/strided_slice:output:0+random_zoom_4/transform/fill_value:output:0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà*
dtype0*
	fill_mode	REFLECT*
interpolation
BILINEAR 
IdentityIdentityGrandom_zoom_4/transform/ImageProjectiveTransformV3:transformed_images:0^NoOp*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿààã
NoOpNoOp7^random_flip_4/stateful_uniform_full_int/RngReadAndSkip2^random_rotation_4/stateful_uniform/RngReadAndSkip.^random_zoom_4/stateful_uniform/RngReadAndSkip*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:ÿÿÿÿÿÿÿÿÿàà: : : 2p
6random_flip_4/stateful_uniform_full_int/RngReadAndSkip6random_flip_4/stateful_uniform_full_int/RngReadAndSkip2f
1random_rotation_4/stateful_uniform/RngReadAndSkip1random_rotation_4/stateful_uniform/RngReadAndSkip2^
-random_zoom_4/stateful_uniform/RngReadAndSkip-random_zoom_4/stateful_uniform/RngReadAndSkip:Y U
1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
 
_user_specified_nameinputs
ª

ø
C__inference_dense_16_layer_call_and_return_conditional_losses_48646

inputs3
matmul_readvariableop_resource:.
biasadd_readvariableop_resource:	
identity¢BiasAdd/ReadVariableOp¢MatMul/ReadVariableOpw
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*!
_output_shapes
:*
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿs
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:*
dtype0w
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿQ
ReluReluBiasAdd:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿb
IdentityIdentityRelu:activations:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿw
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*,
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:Q M
)
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs

h
L__inference_random_rotation_4_layer_call_and_return_conditional_losses_46873

inputs
identityX
IdentityIdentityinputs*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿàà:Y U
1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
 
_user_specified_nameinputs
n
Á
H__inference_random_zoom_4_layer_call_and_return_conditional_losses_46995

inputs6
(stateful_uniform_rngreadandskip_resource:	
identity¢stateful_uniform/RngReadAndSkip;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ñ
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskh
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:
ýÿÿÿÿÿÿÿÿj
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
þÿÿÿÿÿÿÿÿa
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ù
strided_slice_1StridedSliceShape:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskV
CastCaststrided_slice_1:output:0*

DstT0*

SrcT0*
_output_shapes
: h
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:
þÿÿÿÿÿÿÿÿj
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿa
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ù
strided_slice_2StridedSliceShape:output:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskX
Cast_1Caststrided_slice_2:output:0*

DstT0*

SrcT0*
_output_shapes
: Z
stateful_uniform/shape/1Const*
_output_shapes
: *
dtype0*
value	B :
stateful_uniform/shapePackstrided_slice:output:0!stateful_uniform/shape/1:output:0*
N*
T0*
_output_shapes
:Y
stateful_uniform/minConst*
_output_shapes
: *
dtype0*
valueB
 *fff?Y
stateful_uniform/maxConst*
_output_shapes
: *
dtype0*
valueB
 *ÍÌ?`
stateful_uniform/ConstConst*
_output_shapes
:*
dtype0*
valueB: 
stateful_uniform/ProdProdstateful_uniform/shape:output:0stateful_uniform/Const:output:0*
T0*
_output_shapes
: Y
stateful_uniform/Cast/xConst*
_output_shapes
: *
dtype0*
value	B :o
stateful_uniform/Cast_1Caststateful_uniform/Prod:output:0*

DstT0*

SrcT0*
_output_shapes
: ¶
stateful_uniform/RngReadAndSkipRngReadAndSkip(stateful_uniform_rngreadandskip_resource stateful_uniform/Cast/x:output:0stateful_uniform/Cast_1:y:0*
_output_shapes
:n
$stateful_uniform/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: p
&stateful_uniform/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:p
&stateful_uniform/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:¬
stateful_uniform/strided_sliceStridedSlice'stateful_uniform/RngReadAndSkip:value:0-stateful_uniform/strided_slice/stack:output:0/stateful_uniform/strided_slice/stack_1:output:0/stateful_uniform/strided_slice/stack_2:output:0*
Index0*
T0	*
_output_shapes
:*

begin_mask}
stateful_uniform/BitcastBitcast'stateful_uniform/strided_slice:output:0*
T0	*
_output_shapes
:*

type0p
&stateful_uniform/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:r
(stateful_uniform/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:r
(stateful_uniform/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:¢
 stateful_uniform/strided_slice_1StridedSlice'stateful_uniform/RngReadAndSkip:value:0/stateful_uniform/strided_slice_1/stack:output:01stateful_uniform/strided_slice_1/stack_1:output:01stateful_uniform/strided_slice_1/stack_2:output:0*
Index0*
T0	*
_output_shapes
:
stateful_uniform/Bitcast_1Bitcast)stateful_uniform/strided_slice_1:output:0*
T0	*
_output_shapes
:*

type0o
-stateful_uniform/StatelessRandomUniformV2/algConst*
_output_shapes
: *
dtype0*
value	B :
)stateful_uniform/StatelessRandomUniformV2StatelessRandomUniformV2stateful_uniform/shape:output:0#stateful_uniform/Bitcast_1:output:0!stateful_uniform/Bitcast:output:06stateful_uniform/StatelessRandomUniformV2/alg:output:0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿz
stateful_uniform/subSubstateful_uniform/max:output:0stateful_uniform/min:output:0*
T0*
_output_shapes
: 
stateful_uniform/mulMul2stateful_uniform/StatelessRandomUniformV2:output:0stateful_uniform/sub:z:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
stateful_uniformAddV2stateful_uniform/mul:z:0stateful_uniform/min:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿM
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :
concatConcatV2stateful_uniform:z:0stateful_uniform:z:0concat/axis:output:0*
N*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿP
zoom_matrix/ShapeShapeconcat:output:0*
T0*
_output_shapes
:i
zoom_matrix/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: k
!zoom_matrix/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:k
!zoom_matrix/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
zoom_matrix/strided_sliceStridedSlicezoom_matrix/Shape:output:0(zoom_matrix/strided_slice/stack:output:0*zoom_matrix/strided_slice/stack_1:output:0*zoom_matrix/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskV
zoom_matrix/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?_
zoom_matrix/subSub
Cast_1:y:0zoom_matrix/sub/y:output:0*
T0*
_output_shapes
: Z
zoom_matrix/truediv/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @t
zoom_matrix/truedivRealDivzoom_matrix/sub:z:0zoom_matrix/truediv/y:output:0*
T0*
_output_shapes
: v
!zoom_matrix/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*!
valueB"            x
#zoom_matrix/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*!
valueB"           x
#zoom_matrix/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*!
valueB"         Ò
zoom_matrix/strided_slice_1StridedSliceconcat:output:0*zoom_matrix/strided_slice_1/stack:output:0,zoom_matrix/strided_slice_1/stack_1:output:0,zoom_matrix/strided_slice_1/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask*
end_mask*
new_axis_mask*
shrink_axis_maskX
zoom_matrix/sub_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
zoom_matrix/sub_1Subzoom_matrix/sub_1/x:output:0$zoom_matrix/strided_slice_1:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿx
zoom_matrix/mulMulzoom_matrix/truediv:z:0zoom_matrix/sub_1:z:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿX
zoom_matrix/sub_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?a
zoom_matrix/sub_2SubCast:y:0zoom_matrix/sub_2/y:output:0*
T0*
_output_shapes
: \
zoom_matrix/truediv_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @z
zoom_matrix/truediv_1RealDivzoom_matrix/sub_2:z:0 zoom_matrix/truediv_1/y:output:0*
T0*
_output_shapes
: v
!zoom_matrix/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*!
valueB"           x
#zoom_matrix/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*!
valueB"           x
#zoom_matrix/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*!
valueB"         Ò
zoom_matrix/strided_slice_2StridedSliceconcat:output:0*zoom_matrix/strided_slice_2/stack:output:0,zoom_matrix/strided_slice_2/stack_1:output:0,zoom_matrix/strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask*
end_mask*
new_axis_mask*
shrink_axis_maskX
zoom_matrix/sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
zoom_matrix/sub_3Subzoom_matrix/sub_3/x:output:0$zoom_matrix/strided_slice_2:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ|
zoom_matrix/mul_1Mulzoom_matrix/truediv_1:z:0zoom_matrix/sub_3:z:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿv
!zoom_matrix/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*!
valueB"            x
#zoom_matrix/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*!
valueB"           x
#zoom_matrix/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*!
valueB"         Ò
zoom_matrix/strided_slice_3StridedSliceconcat:output:0*zoom_matrix/strided_slice_3/stack:output:0,zoom_matrix/strided_slice_3/stack_1:output:0,zoom_matrix/strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask*
end_mask*
new_axis_mask*
shrink_axis_mask\
zoom_matrix/zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B :
zoom_matrix/zeros/packedPack"zoom_matrix/strided_slice:output:0#zoom_matrix/zeros/packed/1:output:0*
N*
T0*
_output_shapes
:\
zoom_matrix/zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
zoom_matrix/zerosFill!zoom_matrix/zeros/packed:output:0 zoom_matrix/zeros/Const:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ^
zoom_matrix/zeros_1/packed/1Const*
_output_shapes
: *
dtype0*
value	B :
zoom_matrix/zeros_1/packedPack"zoom_matrix/strided_slice:output:0%zoom_matrix/zeros_1/packed/1:output:0*
N*
T0*
_output_shapes
:^
zoom_matrix/zeros_1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
zoom_matrix/zeros_1Fill#zoom_matrix/zeros_1/packed:output:0"zoom_matrix/zeros_1/Const:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿv
!zoom_matrix/strided_slice_4/stackConst*
_output_shapes
:*
dtype0*!
valueB"           x
#zoom_matrix/strided_slice_4/stack_1Const*
_output_shapes
:*
dtype0*!
valueB"           x
#zoom_matrix/strided_slice_4/stack_2Const*
_output_shapes
:*
dtype0*!
valueB"         Ò
zoom_matrix/strided_slice_4StridedSliceconcat:output:0*zoom_matrix/strided_slice_4/stack:output:0,zoom_matrix/strided_slice_4/stack_1:output:0,zoom_matrix/strided_slice_4/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask*
end_mask*
new_axis_mask*
shrink_axis_mask^
zoom_matrix/zeros_2/packed/1Const*
_output_shapes
: *
dtype0*
value	B :
zoom_matrix/zeros_2/packedPack"zoom_matrix/strided_slice:output:0%zoom_matrix/zeros_2/packed/1:output:0*
N*
T0*
_output_shapes
:^
zoom_matrix/zeros_2/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
zoom_matrix/zeros_2Fill#zoom_matrix/zeros_2/packed:output:0"zoom_matrix/zeros_2/Const:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿY
zoom_matrix/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :Ë
zoom_matrix/concatConcatV2$zoom_matrix/strided_slice_3:output:0zoom_matrix/zeros:output:0zoom_matrix/mul:z:0zoom_matrix/zeros_1:output:0$zoom_matrix/strided_slice_4:output:0zoom_matrix/mul_1:z:0zoom_matrix/zeros_2:output:0 zoom_matrix/concat/axis:output:0*
N*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿE
transform/ShapeShapeinputs*
T0*
_output_shapes
:g
transform/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:i
transform/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:i
transform/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ï
transform/strided_sliceStridedSlicetransform/Shape:output:0&transform/strided_slice/stack:output:0(transform/strided_slice/stack_1:output:0(transform/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:Y
transform/fill_valueConst*
_output_shapes
: *
dtype0*
valueB
 *    
$transform/ImageProjectiveTransformV3ImageProjectiveTransformV3inputszoom_matrix/concat:output:0 transform/strided_slice:output:0transform/fill_value:output:0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà*
dtype0*
	fill_mode	REFLECT*
interpolation
BILINEAR
IdentityIdentity9transform/ImageProjectiveTransformV3:transformed_images:0^NoOp*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿààh
NoOpNoOp ^stateful_uniform/RngReadAndSkip*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:ÿÿÿÿÿÿÿÿÿàà: 2B
stateful_uniform/RngReadAndSkipstateful_uniform/RngReadAndSkip:Y U
1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
 
_user_specified_nameinputs
Ë
H
,__inference_sequential_9_layer_call_fn_48200

inputs
identity¼
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_sequential_9_layer_call_and_return_conditional_losses_46882j
IdentityIdentityPartitionedCall:output:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿàà:Y U
1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
 
_user_specified_nameinputs
¸0

H__inference_sequential_13_layer_call_and_return_conditional_losses_47693
sequential_9_input)
conv2d_24_47662:
conv2d_24_47664:)
conv2d_25_47668: 
conv2d_25_47670: )
conv2d_26_47674: @
conv2d_26_47676:@#
dense_16_47682:
dense_16_47684:	!
dense_17_47687:	
dense_17_47689:
identity¢!conv2d_24/StatefulPartitionedCall¢!conv2d_25/StatefulPartitionedCall¢!conv2d_26/StatefulPartitionedCall¢ dense_16/StatefulPartitionedCall¢ dense_17/StatefulPartitionedCallÕ
sequential_9/PartitionedCallPartitionedCallsequential_9_input*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_sequential_9_layer_call_and_return_conditional_losses_46882æ
rescaling_9/PartitionedCallPartitionedCall%sequential_9/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_rescaling_9_layer_call_and_return_conditional_losses_47314
!conv2d_24/StatefulPartitionedCallStatefulPartitionedCall$rescaling_9/PartitionedCall:output:0conv2d_24_47662conv2d_24_47664*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_conv2d_24_layer_call_and_return_conditional_losses_47327ó
 max_pooling2d_24/PartitionedCallPartitionedCall*conv2d_24/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿpp* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *T
fORM
K__inference_max_pooling2d_24_layer_call_and_return_conditional_losses_47271
!conv2d_25/StatefulPartitionedCallStatefulPartitionedCall)max_pooling2d_24/PartitionedCall:output:0conv2d_25_47668conv2d_25_47670*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿpp *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_conv2d_25_layer_call_and_return_conditional_losses_47345ó
 max_pooling2d_25/PartitionedCallPartitionedCall*conv2d_25/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ88 * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *T
fORM
K__inference_max_pooling2d_25_layer_call_and_return_conditional_losses_47283
!conv2d_26/StatefulPartitionedCallStatefulPartitionedCall)max_pooling2d_25/PartitionedCall:output:0conv2d_26_47674conv2d_26_47676*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ88@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_conv2d_26_layer_call_and_return_conditional_losses_47363ó
 max_pooling2d_26/PartitionedCallPartitionedCall*conv2d_26/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *T
fORM
K__inference_max_pooling2d_26_layer_call_and_return_conditional_losses_47295ä
dropout_8/PartitionedCallPartitionedCall)max_pooling2d_26/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_dropout_8_layer_call_and_return_conditional_losses_47375×
flatten_8/PartitionedCallPartitionedCall"dropout_8/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *)
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_flatten_8_layer_call_and_return_conditional_losses_47383
 dense_16/StatefulPartitionedCallStatefulPartitionedCall"flatten_8/PartitionedCall:output:0dense_16_47682dense_16_47684*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_dense_16_layer_call_and_return_conditional_losses_47396
 dense_17/StatefulPartitionedCallStatefulPartitionedCall)dense_16/StatefulPartitionedCall:output:0dense_17_47687dense_17_47689*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_dense_17_layer_call_and_return_conditional_losses_47413x
IdentityIdentity)dense_17/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿø
NoOpNoOp"^conv2d_24/StatefulPartitionedCall"^conv2d_25/StatefulPartitionedCall"^conv2d_26/StatefulPartitionedCall!^dense_16/StatefulPartitionedCall!^dense_17/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:ÿÿÿÿÿÿÿÿÿàà: : : : : : : : : : 2F
!conv2d_24/StatefulPartitionedCall!conv2d_24/StatefulPartitionedCall2F
!conv2d_25/StatefulPartitionedCall!conv2d_25/StatefulPartitionedCall2F
!conv2d_26/StatefulPartitionedCall!conv2d_26/StatefulPartitionedCall2D
 dense_16/StatefulPartitionedCall dense_16/StatefulPartitionedCall2D
 dense_17/StatefulPartitionedCall dense_17/StatefulPartitionedCall:e a
1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
,
_user_specified_namesequential_9_input
ª

ø
C__inference_dense_16_layer_call_and_return_conditional_losses_47396

inputs3
matmul_readvariableop_resource:.
biasadd_readvariableop_resource:	
identity¢BiasAdd/ReadVariableOp¢MatMul/ReadVariableOpw
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*!
_output_shapes
:*
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿs
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:*
dtype0w
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿQ
ReluReluBiasAdd:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿb
IdentityIdentityRelu:activations:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿw
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*,
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:Q M
)
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs

Å
L__inference_random_rotation_4_layer_call_and_return_conditional_losses_48874

inputs6
(stateful_uniform_rngreadandskip_resource:	
identity¢stateful_uniform/RngReadAndSkip;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ñ
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskh
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:
ýÿÿÿÿÿÿÿÿj
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
þÿÿÿÿÿÿÿÿa
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ù
strided_slice_1StridedSliceShape:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskV
CastCaststrided_slice_1:output:0*

DstT0*

SrcT0*
_output_shapes
: h
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:
þÿÿÿÿÿÿÿÿj
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿa
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ù
strided_slice_2StridedSliceShape:output:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskX
Cast_1Caststrided_slice_2:output:0*

DstT0*

SrcT0*
_output_shapes
: d
stateful_uniform/shapePackstrided_slice:output:0*
N*
T0*
_output_shapes
:Y
stateful_uniform/minConst*
_output_shapes
: *
dtype0*
valueB
 *|Ù ¿Y
stateful_uniform/maxConst*
_output_shapes
: *
dtype0*
valueB
 *|Ù ?`
stateful_uniform/ConstConst*
_output_shapes
:*
dtype0*
valueB: 
stateful_uniform/ProdProdstateful_uniform/shape:output:0stateful_uniform/Const:output:0*
T0*
_output_shapes
: Y
stateful_uniform/Cast/xConst*
_output_shapes
: *
dtype0*
value	B :o
stateful_uniform/Cast_1Caststateful_uniform/Prod:output:0*

DstT0*

SrcT0*
_output_shapes
: ¶
stateful_uniform/RngReadAndSkipRngReadAndSkip(stateful_uniform_rngreadandskip_resource stateful_uniform/Cast/x:output:0stateful_uniform/Cast_1:y:0*
_output_shapes
:n
$stateful_uniform/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: p
&stateful_uniform/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:p
&stateful_uniform/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:¬
stateful_uniform/strided_sliceStridedSlice'stateful_uniform/RngReadAndSkip:value:0-stateful_uniform/strided_slice/stack:output:0/stateful_uniform/strided_slice/stack_1:output:0/stateful_uniform/strided_slice/stack_2:output:0*
Index0*
T0	*
_output_shapes
:*

begin_mask}
stateful_uniform/BitcastBitcast'stateful_uniform/strided_slice:output:0*
T0	*
_output_shapes
:*

type0p
&stateful_uniform/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:r
(stateful_uniform/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:r
(stateful_uniform/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:¢
 stateful_uniform/strided_slice_1StridedSlice'stateful_uniform/RngReadAndSkip:value:0/stateful_uniform/strided_slice_1/stack:output:01stateful_uniform/strided_slice_1/stack_1:output:01stateful_uniform/strided_slice_1/stack_2:output:0*
Index0*
T0	*
_output_shapes
:
stateful_uniform/Bitcast_1Bitcast)stateful_uniform/strided_slice_1:output:0*
T0	*
_output_shapes
:*

type0o
-stateful_uniform/StatelessRandomUniformV2/algConst*
_output_shapes
: *
dtype0*
value	B :
)stateful_uniform/StatelessRandomUniformV2StatelessRandomUniformV2stateful_uniform/shape:output:0#stateful_uniform/Bitcast_1:output:0!stateful_uniform/Bitcast:output:06stateful_uniform/StatelessRandomUniformV2/alg:output:0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿz
stateful_uniform/subSubstateful_uniform/max:output:0stateful_uniform/min:output:0*
T0*
_output_shapes
: 
stateful_uniform/mulMul2stateful_uniform/StatelessRandomUniformV2:output:0stateful_uniform/sub:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
stateful_uniformAddV2stateful_uniform/mul:z:0stateful_uniform/min:output:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿZ
rotation_matrix/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?g
rotation_matrix/subSub
Cast_1:y:0rotation_matrix/sub/y:output:0*
T0*
_output_shapes
: ^
rotation_matrix/CosCosstateful_uniform:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ\
rotation_matrix/sub_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?k
rotation_matrix/sub_1Sub
Cast_1:y:0 rotation_matrix/sub_1/y:output:0*
T0*
_output_shapes
: |
rotation_matrix/mulMulrotation_matrix/Cos:y:0rotation_matrix/sub_1:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ^
rotation_matrix/SinSinstateful_uniform:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ\
rotation_matrix/sub_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?i
rotation_matrix/sub_2SubCast:y:0 rotation_matrix/sub_2/y:output:0*
T0*
_output_shapes
: ~
rotation_matrix/mul_1Mulrotation_matrix/Sin:y:0rotation_matrix/sub_2:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ~
rotation_matrix/sub_3Subrotation_matrix/mul:z:0rotation_matrix/mul_1:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ~
rotation_matrix/sub_4Subrotation_matrix/sub:z:0rotation_matrix/sub_3:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ^
rotation_matrix/truediv/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @
rotation_matrix/truedivRealDivrotation_matrix/sub_4:z:0"rotation_matrix/truediv/y:output:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ\
rotation_matrix/sub_5/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?i
rotation_matrix/sub_5SubCast:y:0 rotation_matrix/sub_5/y:output:0*
T0*
_output_shapes
: `
rotation_matrix/Sin_1Sinstateful_uniform:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ\
rotation_matrix/sub_6/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?k
rotation_matrix/sub_6Sub
Cast_1:y:0 rotation_matrix/sub_6/y:output:0*
T0*
_output_shapes
: 
rotation_matrix/mul_2Mulrotation_matrix/Sin_1:y:0rotation_matrix/sub_6:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
rotation_matrix/Cos_1Cosstateful_uniform:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ\
rotation_matrix/sub_7/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?i
rotation_matrix/sub_7SubCast:y:0 rotation_matrix/sub_7/y:output:0*
T0*
_output_shapes
: 
rotation_matrix/mul_3Mulrotation_matrix/Cos_1:y:0rotation_matrix/sub_7:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
rotation_matrix/addAddV2rotation_matrix/mul_2:z:0rotation_matrix/mul_3:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ~
rotation_matrix/sub_8Subrotation_matrix/sub_5:z:0rotation_matrix/add:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
rotation_matrix/truediv_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @
rotation_matrix/truediv_1RealDivrotation_matrix/sub_8:z:0$rotation_matrix/truediv_1/y:output:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿY
rotation_matrix/ShapeShapestateful_uniform:z:0*
T0*
_output_shapes
:m
#rotation_matrix/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: o
%rotation_matrix/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:o
%rotation_matrix/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:¡
rotation_matrix/strided_sliceStridedSlicerotation_matrix/Shape:output:0,rotation_matrix/strided_slice/stack:output:0.rotation_matrix/strided_slice/stack_1:output:0.rotation_matrix/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask`
rotation_matrix/Cos_2Cosstateful_uniform:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿv
%rotation_matrix/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"        x
'rotation_matrix/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"        x
'rotation_matrix/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      Ô
rotation_matrix/strided_slice_1StridedSlicerotation_matrix/Cos_2:y:0.rotation_matrix/strided_slice_1/stack:output:00rotation_matrix/strided_slice_1/stack_1:output:00rotation_matrix/strided_slice_1/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask*
end_mask*
new_axis_mask`
rotation_matrix/Sin_2Sinstateful_uniform:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿv
%rotation_matrix/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB"        x
'rotation_matrix/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB"        x
'rotation_matrix/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      Ô
rotation_matrix/strided_slice_2StridedSlicerotation_matrix/Sin_2:y:0.rotation_matrix/strided_slice_2/stack:output:00rotation_matrix/strided_slice_2/stack_1:output:00rotation_matrix/strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask*
end_mask*
new_axis_maskv
rotation_matrix/NegNeg(rotation_matrix/strided_slice_2:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿv
%rotation_matrix/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB"        x
'rotation_matrix/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB"        x
'rotation_matrix/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      Ö
rotation_matrix/strided_slice_3StridedSlicerotation_matrix/truediv:z:0.rotation_matrix/strided_slice_3/stack:output:00rotation_matrix/strided_slice_3/stack_1:output:00rotation_matrix/strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask*
end_mask*
new_axis_mask`
rotation_matrix/Sin_3Sinstateful_uniform:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿv
%rotation_matrix/strided_slice_4/stackConst*
_output_shapes
:*
dtype0*
valueB"        x
'rotation_matrix/strided_slice_4/stack_1Const*
_output_shapes
:*
dtype0*
valueB"        x
'rotation_matrix/strided_slice_4/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      Ô
rotation_matrix/strided_slice_4StridedSlicerotation_matrix/Sin_3:y:0.rotation_matrix/strided_slice_4/stack:output:00rotation_matrix/strided_slice_4/stack_1:output:00rotation_matrix/strided_slice_4/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask*
end_mask*
new_axis_mask`
rotation_matrix/Cos_3Cosstateful_uniform:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿv
%rotation_matrix/strided_slice_5/stackConst*
_output_shapes
:*
dtype0*
valueB"        x
'rotation_matrix/strided_slice_5/stack_1Const*
_output_shapes
:*
dtype0*
valueB"        x
'rotation_matrix/strided_slice_5/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      Ô
rotation_matrix/strided_slice_5StridedSlicerotation_matrix/Cos_3:y:0.rotation_matrix/strided_slice_5/stack:output:00rotation_matrix/strided_slice_5/stack_1:output:00rotation_matrix/strided_slice_5/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask*
end_mask*
new_axis_maskv
%rotation_matrix/strided_slice_6/stackConst*
_output_shapes
:*
dtype0*
valueB"        x
'rotation_matrix/strided_slice_6/stack_1Const*
_output_shapes
:*
dtype0*
valueB"        x
'rotation_matrix/strided_slice_6/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      Ø
rotation_matrix/strided_slice_6StridedSlicerotation_matrix/truediv_1:z:0.rotation_matrix/strided_slice_6/stack:output:00rotation_matrix/strided_slice_6/stack_1:output:00rotation_matrix/strided_slice_6/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask*
end_mask*
new_axis_mask`
rotation_matrix/zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B :£
rotation_matrix/zeros/packedPack&rotation_matrix/strided_slice:output:0'rotation_matrix/zeros/packed/1:output:0*
N*
T0*
_output_shapes
:`
rotation_matrix/zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
rotation_matrix/zerosFill%rotation_matrix/zeros/packed:output:0$rotation_matrix/zeros/Const:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ]
rotation_matrix/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :
rotation_matrix/concatConcatV2(rotation_matrix/strided_slice_1:output:0rotation_matrix/Neg:y:0(rotation_matrix/strided_slice_3:output:0(rotation_matrix/strided_slice_4:output:0(rotation_matrix/strided_slice_5:output:0(rotation_matrix/strided_slice_6:output:0rotation_matrix/zeros:output:0$rotation_matrix/concat/axis:output:0*
N*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿE
transform/ShapeShapeinputs*
T0*
_output_shapes
:g
transform/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:i
transform/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:i
transform/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ï
transform/strided_sliceStridedSlicetransform/Shape:output:0&transform/strided_slice/stack:output:0(transform/strided_slice/stack_1:output:0(transform/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:Y
transform/fill_valueConst*
_output_shapes
: *
dtype0*
valueB
 *    ¡
$transform/ImageProjectiveTransformV3ImageProjectiveTransformV3inputsrotation_matrix/concat:output:0 transform/strided_slice:output:0transform/fill_value:output:0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà*
dtype0*
	fill_mode	REFLECT*
interpolation
BILINEAR
IdentityIdentity9transform/ImageProjectiveTransformV3:transformed_images:0^NoOp*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿààh
NoOpNoOp ^stateful_uniform/RngReadAndSkip*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:ÿÿÿÿÿÿÿÿÿàà: 2B
stateful_uniform/RngReadAndSkipstateful_uniform/RngReadAndSkip:Y U
1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
 
_user_specified_nameinputs
ÝM
Ó
H__inference_random_flip_4_layer_call_and_return_conditional_losses_47197

inputs?
1stateful_uniform_full_int_rngreadandskip_resource:	
identity¢(stateful_uniform_full_int/RngReadAndSkipi
stateful_uniform_full_int/shapeConst*
_output_shapes
:*
dtype0*
valueB:i
stateful_uniform_full_int/ConstConst*
_output_shapes
:*
dtype0*
valueB: 
stateful_uniform_full_int/ProdProd(stateful_uniform_full_int/shape:output:0(stateful_uniform_full_int/Const:output:0*
T0*
_output_shapes
: b
 stateful_uniform_full_int/Cast/xConst*
_output_shapes
: *
dtype0*
value	B :
 stateful_uniform_full_int/Cast_1Cast'stateful_uniform_full_int/Prod:output:0*

DstT0*

SrcT0*
_output_shapes
: Ú
(stateful_uniform_full_int/RngReadAndSkipRngReadAndSkip1stateful_uniform_full_int_rngreadandskip_resource)stateful_uniform_full_int/Cast/x:output:0$stateful_uniform_full_int/Cast_1:y:0*
_output_shapes
:w
-stateful_uniform_full_int/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: y
/stateful_uniform_full_int/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:y
/stateful_uniform_full_int/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ù
'stateful_uniform_full_int/strided_sliceStridedSlice0stateful_uniform_full_int/RngReadAndSkip:value:06stateful_uniform_full_int/strided_slice/stack:output:08stateful_uniform_full_int/strided_slice/stack_1:output:08stateful_uniform_full_int/strided_slice/stack_2:output:0*
Index0*
T0	*
_output_shapes
:*

begin_mask
!stateful_uniform_full_int/BitcastBitcast0stateful_uniform_full_int/strided_slice:output:0*
T0	*
_output_shapes
:*

type0y
/stateful_uniform_full_int/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:{
1stateful_uniform_full_int/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:{
1stateful_uniform_full_int/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ï
)stateful_uniform_full_int/strided_slice_1StridedSlice0stateful_uniform_full_int/RngReadAndSkip:value:08stateful_uniform_full_int/strided_slice_1/stack:output:0:stateful_uniform_full_int/strided_slice_1/stack_1:output:0:stateful_uniform_full_int/strided_slice_1/stack_2:output:0*
Index0*
T0	*
_output_shapes
:
#stateful_uniform_full_int/Bitcast_1Bitcast2stateful_uniform_full_int/strided_slice_1:output:0*
T0	*
_output_shapes
:*

type0_
stateful_uniform_full_int/algConst*
_output_shapes
: *
dtype0*
value	B :
stateful_uniform_full_intStatelessRandomUniformFullIntV2(stateful_uniform_full_int/shape:output:0,stateful_uniform_full_int/Bitcast_1:output:0*stateful_uniform_full_int/Bitcast:output:0&stateful_uniform_full_int/alg:output:0*
_output_shapes
:*
dtype0	T

zeros_likeConst*
_output_shapes
:*
dtype0	*
valueB	R x
stackPack"stateful_uniform_full_int:output:0zeros_like:output:0*
N*
T0	*
_output_shapes

:d
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB"        f
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       f
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ÷
strided_sliceStridedSlicestack:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0	*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask
3stateless_random_flip_left_right/control_dependencyIdentityinputs*
T0*
_class
loc:@inputs*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
&stateless_random_flip_left_right/ShapeShape<stateless_random_flip_left_right/control_dependency:output:0*
T0*
_output_shapes
:~
4stateless_random_flip_left_right/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 
6stateless_random_flip_left_right/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
6stateless_random_flip_left_right/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ö
.stateless_random_flip_left_right/strided_sliceStridedSlice/stateless_random_flip_left_right/Shape:output:0=stateless_random_flip_left_right/strided_slice/stack:output:0?stateless_random_flip_left_right/strided_slice/stack_1:output:0?stateless_random_flip_left_right/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask®
?stateless_random_flip_left_right/stateless_random_uniform/shapePack7stateless_random_flip_left_right/strided_slice:output:0*
N*
T0*
_output_shapes
:
=stateless_random_flip_left_right/stateless_random_uniform/minConst*
_output_shapes
: *
dtype0*
valueB
 *    
=stateless_random_flip_left_right/stateless_random_uniform/maxConst*
_output_shapes
: *
dtype0*
valueB
 *  ?°
Vstateless_random_flip_left_right/stateless_random_uniform/StatelessRandomGetKeyCounterStatelessRandomGetKeyCounterstrided_slice:output:0* 
_output_shapes
::
Vstateless_random_flip_left_right/stateless_random_uniform/StatelessRandomUniformV2/algConst*
_output_shapes
: *
dtype0*
value	B :þ
Rstateless_random_flip_left_right/stateless_random_uniform/StatelessRandomUniformV2StatelessRandomUniformV2Hstateless_random_flip_left_right/stateless_random_uniform/shape:output:0\stateless_random_flip_left_right/stateless_random_uniform/StatelessRandomGetKeyCounter:key:0`stateless_random_flip_left_right/stateless_random_uniform/StatelessRandomGetKeyCounter:counter:0_stateless_random_flip_left_right/stateless_random_uniform/StatelessRandomUniformV2/alg:output:0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿõ
=stateless_random_flip_left_right/stateless_random_uniform/subSubFstateless_random_flip_left_right/stateless_random_uniform/max:output:0Fstateless_random_flip_left_right/stateless_random_uniform/min:output:0*
T0*
_output_shapes
: 
=stateless_random_flip_left_right/stateless_random_uniform/mulMul[stateless_random_flip_left_right/stateless_random_uniform/StatelessRandomUniformV2:output:0Astateless_random_flip_left_right/stateless_random_uniform/sub:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿû
9stateless_random_flip_left_right/stateless_random_uniformAddV2Astateless_random_flip_left_right/stateless_random_uniform/mul:z:0Fstateless_random_flip_left_right/stateless_random_uniform/min:output:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿr
0stateless_random_flip_left_right/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :r
0stateless_random_flip_left_right/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :r
0stateless_random_flip_left_right/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :Î
.stateless_random_flip_left_right/Reshape/shapePack7stateless_random_flip_left_right/strided_slice:output:09stateless_random_flip_left_right/Reshape/shape/1:output:09stateless_random_flip_left_right/Reshape/shape/2:output:09stateless_random_flip_left_right/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:å
(stateless_random_flip_left_right/ReshapeReshape=stateless_random_flip_left_right/stateless_random_uniform:z:07stateless_random_flip_left_right/Reshape/shape:output:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
&stateless_random_flip_left_right/RoundRound1stateless_random_flip_left_right/Reshape:output:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿy
/stateless_random_flip_left_right/ReverseV2/axisConst*
_output_shapes
:*
dtype0*
valueB:ë
*stateless_random_flip_left_right/ReverseV2	ReverseV2<stateless_random_flip_left_right/control_dependency:output:08stateless_random_flip_left_right/ReverseV2/axis:output:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿààÈ
$stateless_random_flip_left_right/mulMul*stateless_random_flip_left_right/Round:y:03stateless_random_flip_left_right/ReverseV2:output:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿààk
&stateless_random_flip_left_right/sub/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Â
$stateless_random_flip_left_right/subSub/stateless_random_flip_left_right/sub/x:output:0*stateless_random_flip_left_right/Round:y:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿÑ
&stateless_random_flip_left_right/mul_1Mul(stateless_random_flip_left_right/sub:z:0<stateless_random_flip_left_right/control_dependency:output:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà¿
$stateless_random_flip_left_right/addAddV2(stateless_random_flip_left_right/mul:z:0*stateless_random_flip_left_right/mul_1:z:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
IdentityIdentity(stateless_random_flip_left_right/add:z:0^NoOp*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿààq
NoOpNoOp)^stateful_uniform_full_int/RngReadAndSkip*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:ÿÿÿÿÿÿÿÿÿàà: 2T
(stateful_uniform_full_int/RngReadAndSkip(stateful_uniform_full_int/RngReadAndSkip:Y U
1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
 
_user_specified_nameinputs
Ä
Ü
-__inference_sequential_13_layer_call_fn_47797

inputs
unknown:	
	unknown_0:	
	unknown_1:	#
	unknown_2:
	unknown_3:#
	unknown_4: 
	unknown_5: #
	unknown_6: @
	unknown_7:@
	unknown_8:
	unknown_9:	

unknown_10:	

unknown_11:
identity¢StatefulPartitionedCallë
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*,
_read_only_resource_inputs

	
*-
config_proto

CPU

GPU 2J 8 *Q
fLRJ
H__inference_sequential_13_layer_call_and_return_conditional_losses_47597o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*J
_input_shapes9
7:ÿÿÿÿÿÿÿÿÿàà: : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Y U
1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
 
_user_specified_nameinputs
Í
I
-__inference_random_flip_4_layer_call_fn_48671

inputs
identity½
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *Q
fLRJ
H__inference_random_flip_4_layer_call_and_return_conditional_losses_46867j
IdentityIdentityPartitionedCall:output:0*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿàà:Y U
1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
 
_user_specified_nameinputs
²

c
D__inference_dropout_8_layer_call_and_return_conditional_losses_48615

inputs
identityR
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   ?l
dropout/MulMulinputsdropout/Const:output:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@C
dropout/ShapeShapeinputs*
T0*
_output_shapes
:
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@*
dtype0[
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *ÍÌL>®
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@w
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@q
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@a
IdentityIdentitydropout/Mul_1:z:0*
T0*/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:ÿÿÿÿÿÿÿÿÿ@:W S
/
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@
 
_user_specified_nameinputs

g
K__inference_max_pooling2d_25_layer_call_and_return_conditional_losses_48558

inputs
identity¢
MaxPoolMaxPoolinputs*J
_output_shapes8
6:4ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*
ksize
*
paddingVALID*
strides
{
IdentityIdentityMaxPool:output:0*
T0*J
_output_shapes8
6:4ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:r n
J
_output_shapes8
6:4ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
ò

)__inference_conv2d_24_layer_call_fn_48507

inputs!
unknown:
	unknown_0:
identity¢StatefulPartitionedCallã
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_conv2d_24_layer_call_and_return_conditional_losses_47327y
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*4
_input_shapes#
!:ÿÿÿÿÿÿÿÿÿàà: : 22
StatefulPartitionedCallStatefulPartitionedCall:Y U
1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
 
_user_specified_nameinputs

Å
L__inference_random_rotation_4_layer_call_and_return_conditional_losses_47126

inputs6
(stateful_uniform_rngreadandskip_resource:	
identity¢stateful_uniform/RngReadAndSkip;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ñ
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskh
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:
ýÿÿÿÿÿÿÿÿj
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
þÿÿÿÿÿÿÿÿa
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ù
strided_slice_1StridedSliceShape:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskV
CastCaststrided_slice_1:output:0*

DstT0*

SrcT0*
_output_shapes
: h
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:
þÿÿÿÿÿÿÿÿj
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿa
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ù
strided_slice_2StridedSliceShape:output:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskX
Cast_1Caststrided_slice_2:output:0*

DstT0*

SrcT0*
_output_shapes
: d
stateful_uniform/shapePackstrided_slice:output:0*
N*
T0*
_output_shapes
:Y
stateful_uniform/minConst*
_output_shapes
: *
dtype0*
valueB
 *|Ù ¿Y
stateful_uniform/maxConst*
_output_shapes
: *
dtype0*
valueB
 *|Ù ?`
stateful_uniform/ConstConst*
_output_shapes
:*
dtype0*
valueB: 
stateful_uniform/ProdProdstateful_uniform/shape:output:0stateful_uniform/Const:output:0*
T0*
_output_shapes
: Y
stateful_uniform/Cast/xConst*
_output_shapes
: *
dtype0*
value	B :o
stateful_uniform/Cast_1Caststateful_uniform/Prod:output:0*

DstT0*

SrcT0*
_output_shapes
: ¶
stateful_uniform/RngReadAndSkipRngReadAndSkip(stateful_uniform_rngreadandskip_resource stateful_uniform/Cast/x:output:0stateful_uniform/Cast_1:y:0*
_output_shapes
:n
$stateful_uniform/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: p
&stateful_uniform/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:p
&stateful_uniform/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:¬
stateful_uniform/strided_sliceStridedSlice'stateful_uniform/RngReadAndSkip:value:0-stateful_uniform/strided_slice/stack:output:0/stateful_uniform/strided_slice/stack_1:output:0/stateful_uniform/strided_slice/stack_2:output:0*
Index0*
T0	*
_output_shapes
:*

begin_mask}
stateful_uniform/BitcastBitcast'stateful_uniform/strided_slice:output:0*
T0	*
_output_shapes
:*

type0p
&stateful_uniform/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:r
(stateful_uniform/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:r
(stateful_uniform/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:¢
 stateful_uniform/strided_slice_1StridedSlice'stateful_uniform/RngReadAndSkip:value:0/stateful_uniform/strided_slice_1/stack:output:01stateful_uniform/strided_slice_1/stack_1:output:01stateful_uniform/strided_slice_1/stack_2:output:0*
Index0*
T0	*
_output_shapes
:
stateful_uniform/Bitcast_1Bitcast)stateful_uniform/strided_slice_1:output:0*
T0	*
_output_shapes
:*

type0o
-stateful_uniform/StatelessRandomUniformV2/algConst*
_output_shapes
: *
dtype0*
value	B :
)stateful_uniform/StatelessRandomUniformV2StatelessRandomUniformV2stateful_uniform/shape:output:0#stateful_uniform/Bitcast_1:output:0!stateful_uniform/Bitcast:output:06stateful_uniform/StatelessRandomUniformV2/alg:output:0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿz
stateful_uniform/subSubstateful_uniform/max:output:0stateful_uniform/min:output:0*
T0*
_output_shapes
: 
stateful_uniform/mulMul2stateful_uniform/StatelessRandomUniformV2:output:0stateful_uniform/sub:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
stateful_uniformAddV2stateful_uniform/mul:z:0stateful_uniform/min:output:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿZ
rotation_matrix/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?g
rotation_matrix/subSub
Cast_1:y:0rotation_matrix/sub/y:output:0*
T0*
_output_shapes
: ^
rotation_matrix/CosCosstateful_uniform:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ\
rotation_matrix/sub_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?k
rotation_matrix/sub_1Sub
Cast_1:y:0 rotation_matrix/sub_1/y:output:0*
T0*
_output_shapes
: |
rotation_matrix/mulMulrotation_matrix/Cos:y:0rotation_matrix/sub_1:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ^
rotation_matrix/SinSinstateful_uniform:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ\
rotation_matrix/sub_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?i
rotation_matrix/sub_2SubCast:y:0 rotation_matrix/sub_2/y:output:0*
T0*
_output_shapes
: ~
rotation_matrix/mul_1Mulrotation_matrix/Sin:y:0rotation_matrix/sub_2:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ~
rotation_matrix/sub_3Subrotation_matrix/mul:z:0rotation_matrix/mul_1:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ~
rotation_matrix/sub_4Subrotation_matrix/sub:z:0rotation_matrix/sub_3:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ^
rotation_matrix/truediv/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @
rotation_matrix/truedivRealDivrotation_matrix/sub_4:z:0"rotation_matrix/truediv/y:output:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ\
rotation_matrix/sub_5/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?i
rotation_matrix/sub_5SubCast:y:0 rotation_matrix/sub_5/y:output:0*
T0*
_output_shapes
: `
rotation_matrix/Sin_1Sinstateful_uniform:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ\
rotation_matrix/sub_6/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?k
rotation_matrix/sub_6Sub
Cast_1:y:0 rotation_matrix/sub_6/y:output:0*
T0*
_output_shapes
: 
rotation_matrix/mul_2Mulrotation_matrix/Sin_1:y:0rotation_matrix/sub_6:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
rotation_matrix/Cos_1Cosstateful_uniform:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ\
rotation_matrix/sub_7/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?i
rotation_matrix/sub_7SubCast:y:0 rotation_matrix/sub_7/y:output:0*
T0*
_output_shapes
: 
rotation_matrix/mul_3Mulrotation_matrix/Cos_1:y:0rotation_matrix/sub_7:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
rotation_matrix/addAddV2rotation_matrix/mul_2:z:0rotation_matrix/mul_3:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ~
rotation_matrix/sub_8Subrotation_matrix/sub_5:z:0rotation_matrix/add:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
rotation_matrix/truediv_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @
rotation_matrix/truediv_1RealDivrotation_matrix/sub_8:z:0$rotation_matrix/truediv_1/y:output:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿY
rotation_matrix/ShapeShapestateful_uniform:z:0*
T0*
_output_shapes
:m
#rotation_matrix/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: o
%rotation_matrix/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:o
%rotation_matrix/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:¡
rotation_matrix/strided_sliceStridedSlicerotation_matrix/Shape:output:0,rotation_matrix/strided_slice/stack:output:0.rotation_matrix/strided_slice/stack_1:output:0.rotation_matrix/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask`
rotation_matrix/Cos_2Cosstateful_uniform:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿv
%rotation_matrix/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"        x
'rotation_matrix/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"        x
'rotation_matrix/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      Ô
rotation_matrix/strided_slice_1StridedSlicerotation_matrix/Cos_2:y:0.rotation_matrix/strided_slice_1/stack:output:00rotation_matrix/strided_slice_1/stack_1:output:00rotation_matrix/strided_slice_1/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask*
end_mask*
new_axis_mask`
rotation_matrix/Sin_2Sinstateful_uniform:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿv
%rotation_matrix/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB"        x
'rotation_matrix/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB"        x
'rotation_matrix/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      Ô
rotation_matrix/strided_slice_2StridedSlicerotation_matrix/Sin_2:y:0.rotation_matrix/strided_slice_2/stack:output:00rotation_matrix/strided_slice_2/stack_1:output:00rotation_matrix/strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask*
end_mask*
new_axis_maskv
rotation_matrix/NegNeg(rotation_matrix/strided_slice_2:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿv
%rotation_matrix/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB"        x
'rotation_matrix/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB"        x
'rotation_matrix/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      Ö
rotation_matrix/strided_slice_3StridedSlicerotation_matrix/truediv:z:0.rotation_matrix/strided_slice_3/stack:output:00rotation_matrix/strided_slice_3/stack_1:output:00rotation_matrix/strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask*
end_mask*
new_axis_mask`
rotation_matrix/Sin_3Sinstateful_uniform:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿv
%rotation_matrix/strided_slice_4/stackConst*
_output_shapes
:*
dtype0*
valueB"        x
'rotation_matrix/strided_slice_4/stack_1Const*
_output_shapes
:*
dtype0*
valueB"        x
'rotation_matrix/strided_slice_4/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      Ô
rotation_matrix/strided_slice_4StridedSlicerotation_matrix/Sin_3:y:0.rotation_matrix/strided_slice_4/stack:output:00rotation_matrix/strided_slice_4/stack_1:output:00rotation_matrix/strided_slice_4/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask*
end_mask*
new_axis_mask`
rotation_matrix/Cos_3Cosstateful_uniform:z:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿv
%rotation_matrix/strided_slice_5/stackConst*
_output_shapes
:*
dtype0*
valueB"        x
'rotation_matrix/strided_slice_5/stack_1Const*
_output_shapes
:*
dtype0*
valueB"        x
'rotation_matrix/strided_slice_5/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      Ô
rotation_matrix/strided_slice_5StridedSlicerotation_matrix/Cos_3:y:0.rotation_matrix/strided_slice_5/stack:output:00rotation_matrix/strided_slice_5/stack_1:output:00rotation_matrix/strided_slice_5/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask*
end_mask*
new_axis_maskv
%rotation_matrix/strided_slice_6/stackConst*
_output_shapes
:*
dtype0*
valueB"        x
'rotation_matrix/strided_slice_6/stack_1Const*
_output_shapes
:*
dtype0*
valueB"        x
'rotation_matrix/strided_slice_6/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      Ø
rotation_matrix/strided_slice_6StridedSlicerotation_matrix/truediv_1:z:0.rotation_matrix/strided_slice_6/stack:output:00rotation_matrix/strided_slice_6/stack_1:output:00rotation_matrix/strided_slice_6/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask*
end_mask*
new_axis_mask`
rotation_matrix/zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B :£
rotation_matrix/zeros/packedPack&rotation_matrix/strided_slice:output:0'rotation_matrix/zeros/packed/1:output:0*
N*
T0*
_output_shapes
:`
rotation_matrix/zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
rotation_matrix/zerosFill%rotation_matrix/zeros/packed:output:0$rotation_matrix/zeros/Const:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ]
rotation_matrix/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :
rotation_matrix/concatConcatV2(rotation_matrix/strided_slice_1:output:0rotation_matrix/Neg:y:0(rotation_matrix/strided_slice_3:output:0(rotation_matrix/strided_slice_4:output:0(rotation_matrix/strided_slice_5:output:0(rotation_matrix/strided_slice_6:output:0rotation_matrix/zeros:output:0$rotation_matrix/concat/axis:output:0*
N*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿE
transform/ShapeShapeinputs*
T0*
_output_shapes
:g
transform/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:i
transform/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:i
transform/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ï
transform/strided_sliceStridedSlicetransform/Shape:output:0&transform/strided_slice/stack:output:0(transform/strided_slice/stack_1:output:0(transform/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:Y
transform/fill_valueConst*
_output_shapes
: *
dtype0*
valueB
 *    ¡
$transform/ImageProjectiveTransformV3ImageProjectiveTransformV3inputsrotation_matrix/concat:output:0 transform/strided_slice:output:0transform/fill_value:output:0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà*
dtype0*
	fill_mode	REFLECT*
interpolation
BILINEAR
IdentityIdentity9transform/ImageProjectiveTransformV3:transformed_images:0^NoOp*
T0*1
_output_shapes
:ÿÿÿÿÿÿÿÿÿààh
NoOpNoOp ^stateful_uniform/RngReadAndSkip*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:ÿÿÿÿÿÿÿÿÿàà: 2B
stateful_uniform/RngReadAndSkipstateful_uniform/RngReadAndSkip:Y U
1
_output_shapes
:ÿÿÿÿÿÿÿÿÿàà
 
_user_specified_nameinputs"ÛL
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*Ë
serving_default·
[
sequential_9_inputE
$serving_default_sequential_9_input:0ÿÿÿÿÿÿÿÿÿàà<
dense_170
StatefulPartitionedCall:0ÿÿÿÿÿÿÿÿÿtensorflow/serving/predict:ú

layer-0
layer-1
layer_with_weights-0
layer-2
layer-3
layer_with_weights-1
layer-4
layer-5
layer_with_weights-2
layer-6
layer-7
	layer-8

layer-9
layer_with_weights-3
layer-10
layer_with_weights-4
layer-11
	optimizer
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
_default_save_signature

signatures"
_tf_keras_sequential
Ñ
layer-0
layer-1
layer-2
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses"
_tf_keras_sequential
¥
	variables
 trainable_variables
!regularization_losses
"	keras_api
#__call__
*$&call_and_return_all_conditional_losses"
_tf_keras_layer
»

%kernel
&bias
'	variables
(trainable_variables
)regularization_losses
*	keras_api
+__call__
*,&call_and_return_all_conditional_losses"
_tf_keras_layer
¥
-	variables
.trainable_variables
/regularization_losses
0	keras_api
1__call__
*2&call_and_return_all_conditional_losses"
_tf_keras_layer
»

3kernel
4bias
5	variables
6trainable_variables
7regularization_losses
8	keras_api
9__call__
*:&call_and_return_all_conditional_losses"
_tf_keras_layer
¥
;	variables
<trainable_variables
=regularization_losses
>	keras_api
?__call__
*@&call_and_return_all_conditional_losses"
_tf_keras_layer
»

Akernel
Bbias
C	variables
Dtrainable_variables
Eregularization_losses
F	keras_api
G__call__
*H&call_and_return_all_conditional_losses"
_tf_keras_layer
¥
I	variables
Jtrainable_variables
Kregularization_losses
L	keras_api
M__call__
*N&call_and_return_all_conditional_losses"
_tf_keras_layer
¼
O	variables
Ptrainable_variables
Qregularization_losses
R	keras_api
S_random_generator
T__call__
*U&call_and_return_all_conditional_losses"
_tf_keras_layer
¥
V	variables
Wtrainable_variables
Xregularization_losses
Y	keras_api
Z__call__
*[&call_and_return_all_conditional_losses"
_tf_keras_layer
»

\kernel
]bias
^	variables
_trainable_variables
`regularization_losses
a	keras_api
b__call__
*c&call_and_return_all_conditional_losses"
_tf_keras_layer
»

dkernel
ebias
f	variables
gtrainable_variables
hregularization_losses
i	keras_api
j__call__
*k&call_and_return_all_conditional_losses"
_tf_keras_layer

liter

mbeta_1

nbeta_2
	odecay
plearning_rate%mè&mé3mê4mëAmìBmí\mî]mïdmðemñ%vò&vó3vô4võAvöBv÷\vø]vùdvúevû"
	optimizer
f
%0
&1
32
43
A4
B5
\6
]7
d8
e9"
trackable_list_wrapper
f
%0
&1
32
43
A4
B5
\6
]7
d8
e9"
trackable_list_wrapper
 "
trackable_list_wrapper
Ê
qnon_trainable_variables

rlayers
smetrics
tlayer_regularization_losses
ulayer_metrics
	variables
trainable_variables
regularization_losses
__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
2ÿ
-__inference_sequential_13_layer_call_fn_47443
-__inference_sequential_13_layer_call_fn_47766
-__inference_sequential_13_layer_call_fn_47797
-__inference_sequential_13_layer_call_fn_47657À
·²³
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
î2ë
H__inference_sequential_13_layer_call_and_return_conditional_losses_47846
H__inference_sequential_13_layer_call_and_return_conditional_losses_48168
H__inference_sequential_13_layer_call_and_return_conditional_losses_47693
H__inference_sequential_13_layer_call_and_return_conditional_losses_47735À
·²³
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
ÖBÓ
 __inference__wrapped_model_46856sequential_9_input"
²
FullArgSpec
args 
varargsjargs
varkwjkwargs
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
,
vserving_default"
signature_map
¼
w	variables
xtrainable_variables
yregularization_losses
z	keras_api
{_random_generator
|__call__
*}&call_and_return_all_conditional_losses"
_tf_keras_layer
Á
~	variables
trainable_variables
regularization_losses
	keras_api
_random_generator
__call__
+&call_and_return_all_conditional_losses"
_tf_keras_layer
Ã
	variables
trainable_variables
regularization_losses
	keras_api
_random_generator
__call__
+&call_and_return_all_conditional_losses"
_tf_keras_layer
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
²
non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
þ2û
,__inference_sequential_9_layer_call_fn_46885
,__inference_sequential_9_layer_call_fn_48200
,__inference_sequential_9_layer_call_fn_48211
,__inference_sequential_9_layer_call_fn_47242À
·²³
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
ê2ç
G__inference_sequential_9_layer_call_and_return_conditional_losses_48215
G__inference_sequential_9_layer_call_and_return_conditional_losses_48485
G__inference_sequential_9_layer_call_and_return_conditional_losses_47249
G__inference_sequential_9_layer_call_and_return_conditional_losses_47262À
·²³
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
²
non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
	variables
 trainable_variables
!regularization_losses
#__call__
*$&call_and_return_all_conditional_losses
&$"call_and_return_conditional_losses"
_generic_user_object
Õ2Ò
+__inference_rescaling_9_layer_call_fn_48490¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
ð2í
F__inference_rescaling_9_layer_call_and_return_conditional_losses_48498¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
*:(2conv2d_24/kernel
:2conv2d_24/bias
.
%0
&1"
trackable_list_wrapper
.
%0
&1"
trackable_list_wrapper
 "
trackable_list_wrapper
²
non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
'	variables
(trainable_variables
)regularization_losses
+__call__
*,&call_and_return_all_conditional_losses
&,"call_and_return_conditional_losses"
_generic_user_object
Ó2Ð
)__inference_conv2d_24_layer_call_fn_48507¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
î2ë
D__inference_conv2d_24_layer_call_and_return_conditional_losses_48518¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
²
non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
-	variables
.trainable_variables
/regularization_losses
1__call__
*2&call_and_return_all_conditional_losses
&2"call_and_return_conditional_losses"
_generic_user_object
Ú2×
0__inference_max_pooling2d_24_layer_call_fn_48523¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
õ2ò
K__inference_max_pooling2d_24_layer_call_and_return_conditional_losses_48528¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
*:( 2conv2d_25/kernel
: 2conv2d_25/bias
.
30
41"
trackable_list_wrapper
.
30
41"
trackable_list_wrapper
 "
trackable_list_wrapper
²
 non_trainable_variables
¡layers
¢metrics
 £layer_regularization_losses
¤layer_metrics
5	variables
6trainable_variables
7regularization_losses
9__call__
*:&call_and_return_all_conditional_losses
&:"call_and_return_conditional_losses"
_generic_user_object
Ó2Ð
)__inference_conv2d_25_layer_call_fn_48537¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
î2ë
D__inference_conv2d_25_layer_call_and_return_conditional_losses_48548¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
²
¥non_trainable_variables
¦layers
§metrics
 ¨layer_regularization_losses
©layer_metrics
;	variables
<trainable_variables
=regularization_losses
?__call__
*@&call_and_return_all_conditional_losses
&@"call_and_return_conditional_losses"
_generic_user_object
Ú2×
0__inference_max_pooling2d_25_layer_call_fn_48553¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
õ2ò
K__inference_max_pooling2d_25_layer_call_and_return_conditional_losses_48558¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
*:( @2conv2d_26/kernel
:@2conv2d_26/bias
.
A0
B1"
trackable_list_wrapper
.
A0
B1"
trackable_list_wrapper
 "
trackable_list_wrapper
²
ªnon_trainable_variables
«layers
¬metrics
 ­layer_regularization_losses
®layer_metrics
C	variables
Dtrainable_variables
Eregularization_losses
G__call__
*H&call_and_return_all_conditional_losses
&H"call_and_return_conditional_losses"
_generic_user_object
Ó2Ð
)__inference_conv2d_26_layer_call_fn_48567¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
î2ë
D__inference_conv2d_26_layer_call_and_return_conditional_losses_48578¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
²
¯non_trainable_variables
°layers
±metrics
 ²layer_regularization_losses
³layer_metrics
I	variables
Jtrainable_variables
Kregularization_losses
M__call__
*N&call_and_return_all_conditional_losses
&N"call_and_return_conditional_losses"
_generic_user_object
Ú2×
0__inference_max_pooling2d_26_layer_call_fn_48583¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
õ2ò
K__inference_max_pooling2d_26_layer_call_and_return_conditional_losses_48588¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
²
´non_trainable_variables
µlayers
¶metrics
 ·layer_regularization_losses
¸layer_metrics
O	variables
Ptrainable_variables
Qregularization_losses
T__call__
*U&call_and_return_all_conditional_losses
&U"call_and_return_conditional_losses"
_generic_user_object
"
_generic_user_object
2
)__inference_dropout_8_layer_call_fn_48593
)__inference_dropout_8_layer_call_fn_48598´
«²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
Æ2Ã
D__inference_dropout_8_layer_call_and_return_conditional_losses_48603
D__inference_dropout_8_layer_call_and_return_conditional_losses_48615´
«²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
²
¹non_trainable_variables
ºlayers
»metrics
 ¼layer_regularization_losses
½layer_metrics
V	variables
Wtrainable_variables
Xregularization_losses
Z__call__
*[&call_and_return_all_conditional_losses
&["call_and_return_conditional_losses"
_generic_user_object
Ó2Ð
)__inference_flatten_8_layer_call_fn_48620¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
î2ë
D__inference_flatten_8_layer_call_and_return_conditional_losses_48626¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
$:"2dense_16/kernel
:2dense_16/bias
.
\0
]1"
trackable_list_wrapper
.
\0
]1"
trackable_list_wrapper
 "
trackable_list_wrapper
²
¾non_trainable_variables
¿layers
Àmetrics
 Álayer_regularization_losses
Âlayer_metrics
^	variables
_trainable_variables
`regularization_losses
b__call__
*c&call_and_return_all_conditional_losses
&c"call_and_return_conditional_losses"
_generic_user_object
Ò2Ï
(__inference_dense_16_layer_call_fn_48635¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
í2ê
C__inference_dense_16_layer_call_and_return_conditional_losses_48646¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
": 	2dense_17/kernel
:2dense_17/bias
.
d0
e1"
trackable_list_wrapper
.
d0
e1"
trackable_list_wrapper
 "
trackable_list_wrapper
²
Ãnon_trainable_variables
Älayers
Åmetrics
 Ælayer_regularization_losses
Çlayer_metrics
f	variables
gtrainable_variables
hregularization_losses
j__call__
*k&call_and_return_all_conditional_losses
&k"call_and_return_conditional_losses"
_generic_user_object
Ò2Ï
(__inference_dense_17_layer_call_fn_48655¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
í2ê
C__inference_dense_17_layer_call_and_return_conditional_losses_48666¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
:	 (2	Adam/iter
: (2Adam/beta_1
: (2Adam/beta_2
: (2
Adam/decay
: (2Adam/learning_rate
 "
trackable_list_wrapper
v
0
1
2
3
4
5
6
7
	8

9
10
11"
trackable_list_wrapper
0
È0
É1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
ÕBÒ
#__inference_signature_wrapper_48195sequential_9_input"
²
FullArgSpec
args 
varargs
 
varkwjkwargs
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
²
Ênon_trainable_variables
Ëlayers
Ìmetrics
 Ílayer_regularization_losses
Îlayer_metrics
w	variables
xtrainable_variables
yregularization_losses
|__call__
*}&call_and_return_all_conditional_losses
&}"call_and_return_conditional_losses"
_generic_user_object
/
Ï
_generator"
_generic_user_object
2
-__inference_random_flip_4_layer_call_fn_48671
-__inference_random_flip_4_layer_call_fn_48678´
«²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
Î2Ë
H__inference_random_flip_4_layer_call_and_return_conditional_losses_48682
H__inference_random_flip_4_layer_call_and_return_conditional_losses_48740´
«²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
¶
Ðnon_trainable_variables
Ñlayers
Òmetrics
 Ólayer_regularization_losses
Ôlayer_metrics
~	variables
trainable_variables
regularization_losses
__call__
+&call_and_return_all_conditional_losses
'"call_and_return_conditional_losses"
_generic_user_object
/
Õ
_generator"
_generic_user_object
 2
1__inference_random_rotation_4_layer_call_fn_48745
1__inference_random_rotation_4_layer_call_fn_48752´
«²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
Ö2Ó
L__inference_random_rotation_4_layer_call_and_return_conditional_losses_48756
L__inference_random_rotation_4_layer_call_and_return_conditional_losses_48874´
«²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
¸
Önon_trainable_variables
×layers
Ømetrics
 Ùlayer_regularization_losses
Úlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
+&call_and_return_all_conditional_losses
'"call_and_return_conditional_losses"
_generic_user_object
/
Û
_generator"
_generic_user_object
2
-__inference_random_zoom_4_layer_call_fn_48879
-__inference_random_zoom_4_layer_call_fn_48886´
«²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
Î2Ë
H__inference_random_zoom_4_layer_call_and_return_conditional_losses_48890
H__inference_random_zoom_4_layer_call_and_return_conditional_losses_48992´
«²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
 "
trackable_list_wrapper
5
0
1
2"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
R

Ütotal

Ýcount
Þ	variables
ß	keras_api"
_tf_keras_metric
c

àtotal

ácount
â
_fn_kwargs
ã	variables
ä	keras_api"
_tf_keras_metric
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
/
å
_state_var"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
/
æ
_state_var"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
/
ç
_state_var"
_generic_user_object
:  (2total
:  (2count
0
Ü0
Ý1"
trackable_list_wrapper
.
Þ	variables"
_generic_user_object
:  (2total
:  (2count
 "
trackable_dict_wrapper
0
à0
á1"
trackable_list_wrapper
.
ã	variables"
_generic_user_object
=:;	21sequential_11/sequential_9/random_flip_4/StateVar
A:?	25sequential_11/sequential_9/random_rotation_4/StateVar
=:;	21sequential_11/sequential_9/random_zoom_4/StateVar
/:-2Adam/conv2d_24/kernel/m
!:2Adam/conv2d_24/bias/m
/:- 2Adam/conv2d_25/kernel/m
!: 2Adam/conv2d_25/bias/m
/:- @2Adam/conv2d_26/kernel/m
!:@2Adam/conv2d_26/bias/m
):'2Adam/dense_16/kernel/m
!:2Adam/dense_16/bias/m
':%	2Adam/dense_17/kernel/m
 :2Adam/dense_17/bias/m
/:-2Adam/conv2d_24/kernel/v
!:2Adam/conv2d_24/bias/v
/:- 2Adam/conv2d_25/kernel/v
!: 2Adam/conv2d_25/bias/v
/:- @2Adam/conv2d_26/kernel/v
!:@2Adam/conv2d_26/bias/v
):'2Adam/dense_16/kernel/v
!:2Adam/dense_16/bias/v
':%	2Adam/dense_17/kernel/v
 :2Adam/dense_17/bias/v­
 __inference__wrapped_model_46856
%&34AB\]deE¢B
;¢8
63
sequential_9_inputÿÿÿÿÿÿÿÿÿàà
ª "3ª0
.
dense_17"
dense_17ÿÿÿÿÿÿÿÿÿ¸
D__inference_conv2d_24_layer_call_and_return_conditional_losses_48518p%&9¢6
/¢,
*'
inputsÿÿÿÿÿÿÿÿÿàà
ª "/¢,
%"
0ÿÿÿÿÿÿÿÿÿàà
 
)__inference_conv2d_24_layer_call_fn_48507c%&9¢6
/¢,
*'
inputsÿÿÿÿÿÿÿÿÿàà
ª ""ÿÿÿÿÿÿÿÿÿàà´
D__inference_conv2d_25_layer_call_and_return_conditional_losses_48548l347¢4
-¢*
(%
inputsÿÿÿÿÿÿÿÿÿpp
ª "-¢*
# 
0ÿÿÿÿÿÿÿÿÿpp 
 
)__inference_conv2d_25_layer_call_fn_48537_347¢4
-¢*
(%
inputsÿÿÿÿÿÿÿÿÿpp
ª " ÿÿÿÿÿÿÿÿÿpp ´
D__inference_conv2d_26_layer_call_and_return_conditional_losses_48578lAB7¢4
-¢*
(%
inputsÿÿÿÿÿÿÿÿÿ88 
ª "-¢*
# 
0ÿÿÿÿÿÿÿÿÿ88@
 
)__inference_conv2d_26_layer_call_fn_48567_AB7¢4
-¢*
(%
inputsÿÿÿÿÿÿÿÿÿ88 
ª " ÿÿÿÿÿÿÿÿÿ88@¦
C__inference_dense_16_layer_call_and_return_conditional_losses_48646_\]1¢.
'¢$
"
inputsÿÿÿÿÿÿÿÿÿ
ª "&¢#

0ÿÿÿÿÿÿÿÿÿ
 ~
(__inference_dense_16_layer_call_fn_48635R\]1¢.
'¢$
"
inputsÿÿÿÿÿÿÿÿÿ
ª "ÿÿÿÿÿÿÿÿÿ¤
C__inference_dense_17_layer_call_and_return_conditional_losses_48666]de0¢-
&¢#
!
inputsÿÿÿÿÿÿÿÿÿ
ª "%¢"

0ÿÿÿÿÿÿÿÿÿ
 |
(__inference_dense_17_layer_call_fn_48655Pde0¢-
&¢#
!
inputsÿÿÿÿÿÿÿÿÿ
ª "ÿÿÿÿÿÿÿÿÿ´
D__inference_dropout_8_layer_call_and_return_conditional_losses_48603l;¢8
1¢.
(%
inputsÿÿÿÿÿÿÿÿÿ@
p 
ª "-¢*
# 
0ÿÿÿÿÿÿÿÿÿ@
 ´
D__inference_dropout_8_layer_call_and_return_conditional_losses_48615l;¢8
1¢.
(%
inputsÿÿÿÿÿÿÿÿÿ@
p
ª "-¢*
# 
0ÿÿÿÿÿÿÿÿÿ@
 
)__inference_dropout_8_layer_call_fn_48593_;¢8
1¢.
(%
inputsÿÿÿÿÿÿÿÿÿ@
p 
ª " ÿÿÿÿÿÿÿÿÿ@
)__inference_dropout_8_layer_call_fn_48598_;¢8
1¢.
(%
inputsÿÿÿÿÿÿÿÿÿ@
p
ª " ÿÿÿÿÿÿÿÿÿ@ª
D__inference_flatten_8_layer_call_and_return_conditional_losses_48626b7¢4
-¢*
(%
inputsÿÿÿÿÿÿÿÿÿ@
ª "'¢$

0ÿÿÿÿÿÿÿÿÿ
 
)__inference_flatten_8_layer_call_fn_48620U7¢4
-¢*
(%
inputsÿÿÿÿÿÿÿÿÿ@
ª "ÿÿÿÿÿÿÿÿÿî
K__inference_max_pooling2d_24_layer_call_and_return_conditional_losses_48528R¢O
H¢E
C@
inputs4ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
ª "H¢E
>;
04ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 Æ
0__inference_max_pooling2d_24_layer_call_fn_48523R¢O
H¢E
C@
inputs4ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
ª ";84ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿî
K__inference_max_pooling2d_25_layer_call_and_return_conditional_losses_48558R¢O
H¢E
C@
inputs4ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
ª "H¢E
>;
04ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 Æ
0__inference_max_pooling2d_25_layer_call_fn_48553R¢O
H¢E
C@
inputs4ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
ª ";84ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿî
K__inference_max_pooling2d_26_layer_call_and_return_conditional_losses_48588R¢O
H¢E
C@
inputs4ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
ª "H¢E
>;
04ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 Æ
0__inference_max_pooling2d_26_layer_call_fn_48583R¢O
H¢E
C@
inputs4ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
ª ";84ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ¼
H__inference_random_flip_4_layer_call_and_return_conditional_losses_48682p=¢:
3¢0
*'
inputsÿÿÿÿÿÿÿÿÿàà
p 
ª "/¢,
%"
0ÿÿÿÿÿÿÿÿÿàà
 À
H__inference_random_flip_4_layer_call_and_return_conditional_losses_48740tå=¢:
3¢0
*'
inputsÿÿÿÿÿÿÿÿÿàà
p
ª "/¢,
%"
0ÿÿÿÿÿÿÿÿÿàà
 
-__inference_random_flip_4_layer_call_fn_48671c=¢:
3¢0
*'
inputsÿÿÿÿÿÿÿÿÿàà
p 
ª ""ÿÿÿÿÿÿÿÿÿàà
-__inference_random_flip_4_layer_call_fn_48678gå=¢:
3¢0
*'
inputsÿÿÿÿÿÿÿÿÿàà
p
ª ""ÿÿÿÿÿÿÿÿÿààÀ
L__inference_random_rotation_4_layer_call_and_return_conditional_losses_48756p=¢:
3¢0
*'
inputsÿÿÿÿÿÿÿÿÿàà
p 
ª "/¢,
%"
0ÿÿÿÿÿÿÿÿÿàà
 Ä
L__inference_random_rotation_4_layer_call_and_return_conditional_losses_48874tæ=¢:
3¢0
*'
inputsÿÿÿÿÿÿÿÿÿàà
p
ª "/¢,
%"
0ÿÿÿÿÿÿÿÿÿàà
 
1__inference_random_rotation_4_layer_call_fn_48745c=¢:
3¢0
*'
inputsÿÿÿÿÿÿÿÿÿàà
p 
ª ""ÿÿÿÿÿÿÿÿÿàà
1__inference_random_rotation_4_layer_call_fn_48752gæ=¢:
3¢0
*'
inputsÿÿÿÿÿÿÿÿÿàà
p
ª ""ÿÿÿÿÿÿÿÿÿàà¼
H__inference_random_zoom_4_layer_call_and_return_conditional_losses_48890p=¢:
3¢0
*'
inputsÿÿÿÿÿÿÿÿÿàà
p 
ª "/¢,
%"
0ÿÿÿÿÿÿÿÿÿàà
 À
H__inference_random_zoom_4_layer_call_and_return_conditional_losses_48992tç=¢:
3¢0
*'
inputsÿÿÿÿÿÿÿÿÿàà
p
ª "/¢,
%"
0ÿÿÿÿÿÿÿÿÿàà
 
-__inference_random_zoom_4_layer_call_fn_48879c=¢:
3¢0
*'
inputsÿÿÿÿÿÿÿÿÿàà
p 
ª ""ÿÿÿÿÿÿÿÿÿàà
-__inference_random_zoom_4_layer_call_fn_48886gç=¢:
3¢0
*'
inputsÿÿÿÿÿÿÿÿÿàà
p
ª ""ÿÿÿÿÿÿÿÿÿàà¶
F__inference_rescaling_9_layer_call_and_return_conditional_losses_48498l9¢6
/¢,
*'
inputsÿÿÿÿÿÿÿÿÿàà
ª "/¢,
%"
0ÿÿÿÿÿÿÿÿÿàà
 
+__inference_rescaling_9_layer_call_fn_48490_9¢6
/¢,
*'
inputsÿÿÿÿÿÿÿÿÿàà
ª ""ÿÿÿÿÿÿÿÿÿààÏ
H__inference_sequential_13_layer_call_and_return_conditional_losses_47693
%&34AB\]deM¢J
C¢@
63
sequential_9_inputÿÿÿÿÿÿÿÿÿàà
p 

 
ª "%¢"

0ÿÿÿÿÿÿÿÿÿ
 Õ
H__inference_sequential_13_layer_call_and_return_conditional_losses_47735åæç%&34AB\]deM¢J
C¢@
63
sequential_9_inputÿÿÿÿÿÿÿÿÿàà
p

 
ª "%¢"

0ÿÿÿÿÿÿÿÿÿ
 Â
H__inference_sequential_13_layer_call_and_return_conditional_losses_47846v
%&34AB\]deA¢>
7¢4
*'
inputsÿÿÿÿÿÿÿÿÿàà
p 

 
ª "%¢"

0ÿÿÿÿÿÿÿÿÿ
 È
H__inference_sequential_13_layer_call_and_return_conditional_losses_48168|åæç%&34AB\]deA¢>
7¢4
*'
inputsÿÿÿÿÿÿÿÿÿàà
p

 
ª "%¢"

0ÿÿÿÿÿÿÿÿÿ
 ¦
-__inference_sequential_13_layer_call_fn_47443u
%&34AB\]deM¢J
C¢@
63
sequential_9_inputÿÿÿÿÿÿÿÿÿàà
p 

 
ª "ÿÿÿÿÿÿÿÿÿ¬
-__inference_sequential_13_layer_call_fn_47657{åæç%&34AB\]deM¢J
C¢@
63
sequential_9_inputÿÿÿÿÿÿÿÿÿàà
p

 
ª "ÿÿÿÿÿÿÿÿÿ
-__inference_sequential_13_layer_call_fn_47766i
%&34AB\]deA¢>
7¢4
*'
inputsÿÿÿÿÿÿÿÿÿàà
p 

 
ª "ÿÿÿÿÿÿÿÿÿ 
-__inference_sequential_13_layer_call_fn_47797oåæç%&34AB\]deA¢>
7¢4
*'
inputsÿÿÿÿÿÿÿÿÿàà
p

 
ª "ÿÿÿÿÿÿÿÿÿÍ
G__inference_sequential_9_layer_call_and_return_conditional_losses_47249N¢K
D¢A
74
random_flip_4_inputÿÿÿÿÿÿÿÿÿàà
p 

 
ª "/¢,
%"
0ÿÿÿÿÿÿÿÿÿàà
 Õ
G__inference_sequential_9_layer_call_and_return_conditional_losses_47262åæçN¢K
D¢A
74
random_flip_4_inputÿÿÿÿÿÿÿÿÿàà
p

 
ª "/¢,
%"
0ÿÿÿÿÿÿÿÿÿàà
 ¿
G__inference_sequential_9_layer_call_and_return_conditional_losses_48215tA¢>
7¢4
*'
inputsÿÿÿÿÿÿÿÿÿàà
p 

 
ª "/¢,
%"
0ÿÿÿÿÿÿÿÿÿàà
 Ç
G__inference_sequential_9_layer_call_and_return_conditional_losses_48485|åæçA¢>
7¢4
*'
inputsÿÿÿÿÿÿÿÿÿàà
p

 
ª "/¢,
%"
0ÿÿÿÿÿÿÿÿÿàà
 ¤
,__inference_sequential_9_layer_call_fn_46885tN¢K
D¢A
74
random_flip_4_inputÿÿÿÿÿÿÿÿÿàà
p 

 
ª ""ÿÿÿÿÿÿÿÿÿàà¬
,__inference_sequential_9_layer_call_fn_47242|åæçN¢K
D¢A
74
random_flip_4_inputÿÿÿÿÿÿÿÿÿàà
p

 
ª ""ÿÿÿÿÿÿÿÿÿàà
,__inference_sequential_9_layer_call_fn_48200gA¢>
7¢4
*'
inputsÿÿÿÿÿÿÿÿÿàà
p 

 
ª ""ÿÿÿÿÿÿÿÿÿàà
,__inference_sequential_9_layer_call_fn_48211oåæçA¢>
7¢4
*'
inputsÿÿÿÿÿÿÿÿÿàà
p

 
ª ""ÿÿÿÿÿÿÿÿÿààÆ
#__inference_signature_wrapper_48195
%&34AB\]de[¢X
¢ 
QªN
L
sequential_9_input63
sequential_9_inputÿÿÿÿÿÿÿÿÿàà"3ª0
.
dense_17"
dense_17ÿÿÿÿÿÿÿÿÿ