fx_version 'cerulean'
games { 'gta5' }

lua54 'yes'

data_file 'DLC_ITYP_REQUEST' 'stream/rcore_bang_beaver.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/rcore_balloon.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/rcore_int_mlo_ytyp.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/rcore_interior.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/rcore_carnival_props.ytyp'

escrow_ignore {
    "stream/*.gfx",
    "stream/*.ytyp",
    "stream/*.ydr",
    "stream/*.ymap",
    "stream/*.ybn",
	"stream/props/*.*",
}
dependency '/assetpacks'