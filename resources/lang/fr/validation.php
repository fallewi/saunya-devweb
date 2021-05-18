<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Validation Language Lines
    |--------------------------------------------------------------------------
    |
    | the following language lines contain the default error messages used by
    | the validator class. Some of these rules have multiple versions such
    | as the size rules. Feel free to tweak each of these messages here.
    |
    */

    'accepted'             => 'l\'attribut :attribute doit être accepté.',
    'active_url'           => 'l\'attribut :attribute n\'est pas une URL valide.',
    'after'                => 'l\'attribut :attribute doit être une date après :date.',
    'after_or_equal'       => 'l\'attribut :attribute doit être une date postérieure ou égale à :date.',
    'alpha'                => 'l\'attribut :attribute ne peut contenir que des lettres.',
    'alpha_dash'           => 'l\'attribut :attribute ne peut contenir que des lettres, des chiffres, des tirets et des traits de soulignement.',
    'alpha_num'            => 'l\'attribut :attribute ne peut contenir que des lettres et des chiffres.',
    'array'                => 'l\'attribut :attribute doit être un tableau.',
    'before'               => 'l\'attribut :attribute doit être une date antérieure :date.',
    'before_or_equal'      => 'l\'attribut :attribute doit être une date antérieure ou égale à :date.',
    'between'              => [
        'numeric' => 'l\'attribut :attribute Doit être entre :min et :max.',
        'file'    => 'l\'attribut :attribute Doit être entre :min et :max kilobytes.',
        'string'  => 'l\'attribut :attribute Doit être entre :min et :max caractères.',
        'array'   => 'l\'attribut :attribute doit avoir entre :min et :max items.',
    ],
    'boolean'              => 'l\'attribut :attribute le champ doit être vrai ou faux.',
    'confirmed'            => 'l\'attribut :attribute le champ doit être vrai ou la confirmation ne correspond pas.',
    'date'                 => 'l\'attribut :attribute la date n\'est pas valide.',
    'date_format'          => 'l\'attribut :attribute ne correspond pas au format :format.',
    'different'            => 'l\'attribut :attribute et :other doit être différent.',
    'digits'               => 'l\'attribut :attribute doit être :digits chiffres.',
    'digits_between'       => 'l\'attribut :attribute Doit être entre :min et :max chiffres.',
    'dimensions'           => 'l\'attribut :attribute a des dimensions d\'image non valides.',
    'distinct'             => 'l\'attribut :attribute le champ a une valeur en double.',
    'email'                => 'l\'attribut :attribute Doit être une adresse e-mail valide.',
    'exists'               => 'l\'attribut selectionné :attribute est invalide.',
    'file'                 => 'l\'attribut :attribute  doit être un fichier.',
    'filled'               => 'l\'attribut :attribute le champ doit avoir une valeur.',
    'gt'                   => [
        'numeric' => 'l\'attribut :attribute doit être supérieur à :value.',
        'file'    => 'l\'attribut :attribute doit être supérieur à :value kilobytes.',
        'string'  => 'l\'attribut :attribute doit être supérieur à :value caractères.',
        'array'   => 'l\'attribut :attribute must have more than :value items.',
    ],
    'gte'                  => [
        'numeric' => 'l\'attribut :attribute doit être supérieur à ou égal à :value.',
        'file'    => 'l\'attribut :attribute doit être supérieur à ou égal à :value kilobytes.',
        'string'  => 'l\'attribut :attribute doit être supérieur à ou égal à :value caractères.',
        'array'   => 'l\'attribut :attribute must have :value items or more.',
    ],
    'image'                => 'l\'attribut :attribute doit être une image.',
    'in'                   => 'l\'attribut selectionné :attribute est invalide.',
    'in_array'             => 'l\'attribut :attribute le champ n\'existe pas dans :other.',
    'integer'              => 'l\'attribut :attribute doit être un entier.',
    'ip'                   => 'l\'attribut :attribute doit être une adresse IP valide.',
    'ipv4'                 => 'l\'attribut :attribute doit être une adresse IPv4 valide.',
    'ipv6'                 => 'l\'attribut :attribute doit être une adresse IPv6 valide.',
    'json'                 => 'l\'attribut :attribute doit être une chaîne JSON valide.',
    'lt'                   => [
        'numeric' => 'l\'attribut :attribute doit être inférieur à :value.',
        'file'    => 'l\'attribut :attribute doit être inférieur à :value kilobytes.',
        'string'  => 'l\'attribut :attribute doit être inférieur à :value caractères.',
        'array'   => 'l\'attribut :attribute doit avoir au moins :value éléments.',
    ],
    'lte'                  => [
        'numeric' => 'l\'attribut :attribute doit être inférieur à ou égal à :value.',
        'file'    => 'l\'attribut :attribute doit être inférieur à ou égal à :value kilobytes.',
        'string'  => 'l\'attribut :attribute doit être inférieur à ou égal à :value caractères.',
        'array'   => 'l\'attribut :attribute ne doit pas avoir plus de  :value éléments.',
    ],
    'max'                  => [
        'numeric' => 'l\'attribut :attribute ne peut pas être supérieur à :max.',
        'file'    => 'l\'attribut :attribute ne peut pas être supérieur à :max kilobytes.',
        'string'  => 'l\'attribut :attribute ne peut pas être supérieur à :max caractères.',
        'array'   => 'l\'attribut :attribute ne doit pas avoir plus de :max éléments.',
    ],
    'mimes'                => 'l\'attribut :attribute doit être un fichier de type: :values.',
    'mimetypes'            => 'l\'attribut :attribute doit être un fichier de type: :values.',
    'min'                  => [
        'numeric' => 'l\'attribut :attribute doit être un fichier de :min.',
        'file'    => 'l\'attribut :attribute doit être un fichier de :min kilobytes.',
        'string'  => 'l\'attribut :attribute doit être un fichier de :min caractères.',
        'array'   => 'l\'attribut :attribute doit avoir au moins :min éléments.',
    ],
    'not_in'               => 'l\'attribut sélectionné :attribute est invalide .',
    'not_regex'            => 'l\'attribut :attribute format est invalide .',
    'numeric'              => 'l\'attribut :attribute doit être a number.',
    'present'              => 'l\'attribut :attribute , ce champ doit être présent.',
    'regex'                => 'l\'attribut :attribute , le format est invalide .',
    'required'             => 'l\'attribut :attribute le champ est requis.',
    'required_if'          => 'l\'attribut :attribute le champ est requis lorsque :other est :value.',
    'required_unless'      => 'l\'attribut :attribute le champ est requis à moins que  :other est contenu dans :values.',
    'required_with'        => 'l\'attribut :attribute le champ est requis lorsque :values est présent.',
    'required_with_all'    => 'l\'attribut :attribute le champ est requis lorsque :values est présent.',
    'required_without'     => 'l\'attribut :attribute le champ est requis lorsque :values n\'est pas présent.',
    'required_without_all' => 'l\'attribut :attribute le champ est requis lorsque none of :values sont présent.',
    'same'                 => 'l\'attribut :attribute et :other doivent être identique.',
    'size'                 => [
        'numeric' => 'l\'attribut :attribute doit être :size.',
        'file'    => 'l\'attribut :attribute doit être :size kilobytes.',
        'string'  => 'l\'attribut :attribute doit être :size caractères.',
        'array'   => 'l\'attribut :attribute doit contenir :size items.',
    ],
    'string'               => 'l\'attribut :attribute doit être un chaine de cractère.',
    'timezone'             => 'l\'attribut :attribute doit être une zone valide.',
    'unique'               => 'l\'attribut :attribute a déja été pris.',
    'uploaded'             => 'l\'attribut :attribute , Echec du chargement.',
    'url'                  => 'l\'attribut :attribute , le format est invalide .',

    /*
    |--------------------------------------------------------------------------
    | Custom Validation Language Lines
    |--------------------------------------------------------------------------
    |
    | Here you may specify custom validation messages for attributes using the
    | convention "attribute.rule" to name l\'attribut lines. This makes it quick to
    | specify a specific custom language line for a given attribute rule.
    |
    */

    'custom' => [
        'attribute-name' => [
            'rule-name' => 'custom-message',
        ],
    ],

    /*
    |--------------------------------------------------------------------------
    | Custom Validation Attributes
    |--------------------------------------------------------------------------
    |
    | l\'attribut following language lines are used to swap attribute place-holders
    | with something more reader friendly such as E-Mail Address instead
    | of "email". This simply helps us make messages a little cleaner.
    |
    */

    'attributes' => [],

];
