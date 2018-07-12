            precision mediump float;
            varying vec4 color;
            uniform float u_time;
            uniform vec2 u_resolution;
            uniform sampler2D u_texture1;
            uniform sampler2D u_texture2;
            void main( void ) {
            vec4 fragColor=vec4(0.);
            vec2 uv = gl_FragCoord.xy / u_resolution.xy; 
            uv.y=1.-uv.y;
            float perWidth = 0.1;
            float rspeed = 2.5;
            float index = floor( uv.x / perWidth );
            float centerX = perWidth * ( index + 0.5 );
            float left = perWidth * index;
            float right = left + perWidth;

            float perRotateTime = 3.14159 / rspeed;
            float uot=u_time;
            float iTime=mod(u_time,perRotateTime*(1./perWidth));
            float startRotateTime = perRotateTime * 0.5 * index;
            float endRotateTime = startRotateTime + perRotateTime;
            bool x= (perRotateTime*(1./perWidth))>(mod(uot,2.*perRotateTime*(1./perWidth)));
            float angle = (iTime - startRotateTime) * rspeed;
            vec2 cod = vec2(( uv.x - centerX) / cos( angle ) + centerX, uv.y );

            if( iTime <= startRotateTime ) {
                fragColor = x?texture2D(u_texture1, uv ):texture2D(u_texture2, uv );
            }
            else if( iTime > endRotateTime ) {
                fragColor = x?texture2D(u_texture2, uv ):texture2D(u_texture1, uv );
            }
            else if( cod.x <= right && cod.x >= left ) {
                if( angle <= 1.5707 ) {
                        fragColor = x?texture2D(u_texture1, cod ):texture2D(u_texture2, cod );
                } else if( angle <= 3.14159 ) {
                        fragColor = x?texture2D(u_texture2, vec2( right - cod.x + left, cod.y ) ):texture2D(u_texture1, vec2( right - cod.x + left, cod.y ) );
                }
            } else {
                fragColor = vec4( vec3( 0.0 ), 1.0 );   
            }
            gl_FragColor = fragColor;
            }
