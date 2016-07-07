/*
The basic default ShaderToy shader: https://www.shadertoy.com/new

Original Code:
void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
	vec2 uv = fragCoord.xy / iResolution.xy;
	fragColor = vec4(uv,0.5+0.5*sin(iGlobalTime),1.0);
}
*/

Shader "Custom/ColorPalette" {
	Properties {}
	SubShader {
		Pass {
			CGPROGRAM
			//#pragma surface surf Standard fullforwardshadows
			#pragma vertex vert
			#pragma fragment frag

			// Use shader model 3.0 target, to get nicer looking lighting
			#pragma target 3.0

			struct v2f {
				float4 position : SV_POSITION;
			};

			v2f vert(float4 v:POSITION) : SV_POSITION{
				v2f o;
				o.position = mul(UNITY_MATRIX_MVP, v);
				return o;
			}

			fixed4 frag(v2f i) : SV_Target
			{
				float2 uv = i.position.xy / _ScreenParams.xy;
				fixed4 outColor = fixed4(float2(uv.x,1-uv.y),1 - 0.5 + 0.5*sin(_Time.xy * 25));
				return outColor;
			}

			ENDCG
		}
	}
}
