#include "objectHF.hlsli"

struct VertexOut
{
	float4 pos				: SV_POSITION;
	float4 color			: COLOR;
	float2 tex				: TEXCOORD0;
};

VertexOut main(Input_Object_POS_TEX input)
{
	VertexOut Out;

	float4x4 WORLD = MakeWorldMatrixFromInstance(input.inst);
	VertexSurface surface = MakeVertexSurfaceFromInput(input);

	surface.position = mul(surface.position, WORLD);

	Out.pos = mul(surface.position, g_xCamera_VP);
	Out.color = surface.color;
	Out.tex = surface.uv;

	return Out;
}