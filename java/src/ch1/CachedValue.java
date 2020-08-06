package ch1;

public abstract class CachedValue<T> implements Value<T>, Cacheable<T> {
    protected T val;

    @Override
    public T value() {
        if (val == null)
            compute();
        return val;
    }
}
