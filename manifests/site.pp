## site.pp ##
# Lookup all classes defined in Hiera and other data sources
lookup('classes', Array[String], 'unique').include
