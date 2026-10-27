export type TapMetadata = Record<
	string,
	{
		type?: 'first-party' | 'fork' | 'mirror' | 'pin' | 'third-party'
		updateStrategy?: 'upstream'
		upstreamName?: string
		upstreamPath?: string
		upstreamTap?: string
	}
>
