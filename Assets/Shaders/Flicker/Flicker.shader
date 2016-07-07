/*
Original shader by jackdavenport in 2015-May-31
https://www.shadertoy.com/view/Xlj3D3

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
	float x = 1. * abs(sin(iGlobalTime * 1000.));
	fragColor = vec4(x);

}
*/

Shader "Custom/Flicker" {
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
				//float2 uv = i.position.xy / _ScreenParams.xy;
				//fixed4 outColor = fixed4(uv, 0.5 + 0.5*sin(_Time.xy));

				//float x = _Time.; // 1.0 * abs(sin(_Time.xz * 10));
				float x = 1.0 * abs(sin(_Time.xy * 1000));
				fixed4 outColor = fixed4(x, x, x, x);
				return outColor;
			}

			ENDCG
		}
	}
}


