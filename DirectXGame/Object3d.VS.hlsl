#include "object3d.hlsli"
//P38まで

struct TransformationMatrix{
    float32_t4x4 WVP;
};

ConstantBuffer<TransformationMatrix> gTransformationMatrix : register(b0);
    
struct VertexShaderInput
{
    float32_t4 position : POSITION0;
        float32_t2 textcoord : TEXCOORD0;
    };

VertexShaderOutput main(VertexShaderInput input)
{
    VertexShaderOutput output;
    output.position = mul(input.position,gTransformationMatrix.WVP);
        output.texcoord = input.texcoord;
        return output;
}