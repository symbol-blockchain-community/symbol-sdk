/**
 * Represents a network timestamp.
 */
export class NetworkTimestamp {
	private _timestamp: bigint;
	/**
	 * Creates a timestamp.
	 * @param {number|bigint} timestamp Raw network timestamp.
	 */
	constructor(timestamp: number | bigint) {
		/**
		 * Underlying timestamp.
		 * @type bigint
		 */
		this._timestamp = BigInt(timestamp);
	}

	/**
	 * Gets the raw network timestamp.
	 * @type {bigint}
	 */
	get timestamp(): bigint {
		return this._timestamp;
	}

	/**
	 * Determines if this is the epochal timestamp.
	 */
	get isEpochal() {
		return 0n === this._timestamp;
	}

	/**
	 * Adds a specified number of seconds to this timestamp.
	 * @abstract
	 * @param {number|bigint} count Number of seconds to add.
	 * @returns {NetworkTimestamp} New timestamp that is the specified number of seconds past this timestamp.
	 */
	addSeconds(count: number | bigint): NetworkTimestamp { // eslint-disable-line class-methods-use-this, no-unused-vars
		throw new Error('`addSeconds` must be implemented by concrete class');
	}

	/**
	 * Adds a specified number of minutes to this timestamp.
	 * @param {number|bigint} count Number of minutes to add.
	 * @returns {NetworkTimestamp} New timestamp that is the specified number of minutes past this timestamp.
	 */
	addMinutes(count: number | bigint): NetworkTimestamp {
		return this.addSeconds(60n * BigInt(count));
	}

	/**
	 * Adds a specified number of hours to this timestamp.
	 * @param {number|bigint} count Number of hours to add.
	 * @returns {NetworkTimestamp} New timestamp that is the specified number of hours past this timestamp.
	 */
	addHours(count: number | bigint): NetworkTimestamp {
		return this.addMinutes(60n * BigInt(count));
	}

	/**
	 * Returns string representation of this object.
	 * @returns {string} String representation of this object
	 */
	toString(): string {
		return this.timestamp.toString();
	}
}

type TimeUnit = 'hours' | 'minutes' | 'seconds' | 'milliseconds';

/**
 * Provides utilities for converting between network timestamps and datetimes.
 */
export class NetworkTimestampDatetimeConverter {
	private _epoch: Date;
	private _timeUnits: number;
	/**
	 * Creates a converter given an epoch and base time units.
	 * @param {Date} epoch Date at which network started.
	 * @param {string} timeUnits Time unit the network uses for progressing.
	 */
	constructor(epoch: Date, timeUnits: TimeUnit) {
		/**
		 * Date at which network started
		 * @type Date
		 */
		this._epoch = epoch;

		/**
		 * Number of milliseconds per time unit.
		 * @type number
		 */
		const timeUnitsMap: { [key in TimeUnit]: number } = {
			hours: 60 * 60 * 1000,
			minutes: 60 * 1000,
			seconds: 1000,
			milliseconds: 1
		};
		const timeUnitValue = timeUnitsMap[timeUnits];
		if (timeUnitValue === undefined) {
			throw new Error(`Invalid time unit: ${timeUnits}`);
		}

		this._timeUnits = timeUnitValue;
	}

	/**
	 * Gets the network epoch.
	 * @type {Date}
	 */
	get epoch(): Date {
		return this._epoch;
	}

	/**
	 * Gets the time units.
	 * @type {number}
	 */
	get timeUnits(): number {
		return this._timeUnits;
	}

	/**
	 * Converts a network timestamp to a datetime.
	 * @param {number} rawTimestamp Raw network timestamp.
	 * @returns {Date} Date representation of the network timestamp.
	 */
	toDatetime(rawTimestamp: number): Date {
		return new Date(this._epoch.getTime() + (Number(rawTimestamp) * this._timeUnits));
	}

	/**
	 * Subtracts the network epoch from the reference date.
	 * @param {Date} referenceDatetime Reference date.
	 * @returns {number} Number of network time units between the reference date and the network epoch.
	 */
	toDifference(referenceDatetime: Date): number {
		if (referenceDatetime < this._epoch)
			throw RangeError('timestamp cannot be before epoch');

		const subtractDates = (lhs: Date, rhs: Date) => (lhs.getTime() - rhs.getTime());
		return subtractDates(referenceDatetime, this._epoch) / this._timeUnits;
	}
}
