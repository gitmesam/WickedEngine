#include "objectHF.hlsli"

struct VSOut
{
	float4 pos : SV_POSITION;
	float4 color : COLOR;
	float2 tex : TEXCOORD;
	float3 nor : NORMAL;
};

VSOut main(Input_Object_POS_TEX input)
{
	VSOut Out;

	float4x4 WORLD = MakeWorldMatrixFromInstance(input.inst);
	VertexSurface surface = MakeVertexSurfaceFromInput(input);

	Out.pos = mul(surface.position, WORLD);
	Out.color = surface.color;
	Out.tex = surface.uv;
	Out.nor = normalize(mul(surface.normal, (float3x3)WORLD));

	return Out;
}